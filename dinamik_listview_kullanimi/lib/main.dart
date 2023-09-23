import 'package:dinamik_listview_kullanimi/DetaySayfa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var ulkeler = ["Türkiye","Almanya","İtalya","Fransa","Çin"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Dinamik LİstView Kullanımı"),
      ),
      body: SizedBox(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: ulkeler.length,
          itemBuilder: (context, indeks)
          {
            return GestureDetector(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(ulkeAdi: ulkeler[indeks],)));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: ()
                          {
                            print("${ulkeler[indeks]} ülkesi seçildi.");
                          },
                            child: Text(ulkeler[indeks])
                        ),
                        Spacer(),
                        PopupMenuButton(
                          child: Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(value: 1, child: Text("Sil"),),
                            PopupMenuItem(value: 2, child: Text("Güncelle"),),
                          ],
                          onSelected: (menuItemValue)
                          {
                            if(menuItemValue == 1)
                            {
                              print("${ulkeler[indeks]} Silindi");
                            }
                            if(menuItemValue == 2)
                            {
                              print("${ulkeler[indeks]} Güncellendi");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

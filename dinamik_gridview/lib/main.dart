import 'dart:math';

import 'package:dinamik_gridview/DetyaSayfa.dart';
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

  var ulkeler = ["Türkiye","Almanya","İtalya","Rusya","Çin"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Dinamik GridView"),
      ),
      body:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 1 ,
        ),
        itemCount: ulkeler.length,
        itemBuilder: (context, indeks)
        {
          var R = Random().nextInt(999);
          var G = Random().nextInt(999);
          var B = Random().nextInt(999);
          return GestureDetector(
            onTap: ()
            {
              print("${ulkeler[indeks]} Seçildi");
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(ulkeAdi: ulkeler[indeks],)));
            },
            child: Card(
              color: Color.fromRGBO(R, G, B,1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${ulkeler[indeks]}",style: TextStyle(color: Colors.white),),
                    Spacer(),
                    PopupMenuButton(
                      child: Icon(Icons.more_vert,color: Colors.white,),
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
          );
        }
      ),
    );
  }
}

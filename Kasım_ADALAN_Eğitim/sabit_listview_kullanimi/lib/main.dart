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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ListView Kullanımı"),
      ),
      body:
        ListView(
          children: [
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text("Güneş"),
              subtitle: Text("Güneş Alt Başlık"),
              trailing: Icon(Icons.arrow_right),
              onTap: ()
              {
                print("Ay Tılandı");
              },
            ),
            ListTile(
              leading: Icon(Icons.brightness_2),
              title: Text("Ay"),
              subtitle: Text("Ay Alt Başlık"),
              trailing: Icon(Icons.arrow_right),
              onTap: ()
              {
                print("Ay Tılandı");
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Yıldız"),
              subtitle: Text("Yıldız Alt Başlık"),
              trailing: Icon(Icons.arrow_right),
              onTap: ()
              {
                print("Yıldız Tılandı");
              },
            ),
            GestureDetector(
              onTap: ()
              {
                print("Card Tıklandı");
              },
              child: Card(
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Text("Card Tasarım"),
                      Spacer(),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              color: Colors.red,
              child: Text("Merhaba"),
            ),
          ],
        ),
      );
  }
}

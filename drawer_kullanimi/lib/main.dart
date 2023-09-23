import 'package:drawer_kullanimi/SayfaBir.dart';
import 'package:drawer_kullanimi/SayfaIki.dart';
import 'package:drawer_kullanimi/SayfaUc.dart';
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

  var sayfaListe = [SayfaBir(), SayfaIki(), SayfaUc()];
  late int secilenIndeks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Drawer Kullanımı"),
      ),
      body: sayfaListe[secilenIndeks],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Başlık Tasarımı",style: TextStyle(color:Colors.white,fontSize: 30),),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              title: Text("Sayfa Bir",),
              onTap: ()
              {
                setState(() {
                  secilenIndeks = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Sayfa İki",style: TextStyle(color:Colors.pink),),
              onTap: ()
              {
                setState(() {
                  secilenIndeks = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Sayfa Üç"),
              leading: Icon(Icons.looks_3,color: Colors.deepOrange,),
              onTap: ()
              {
                setState(() {
                  secilenIndeks = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

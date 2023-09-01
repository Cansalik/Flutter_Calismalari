import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler_tablo");

  Future<void> kisiEkle() async
  {
    var bilgi = HashMap<String, dynamic>();
    bilgi["kisi_ad"] = "Ahmet";
    bilgi["kisi_yas"] = 29;
    refKisiler.push().set(bilgi);
  }

  Future<void> kisiSil() async
  {
    refKisiler.child("-NdG4xuEtudh8xL6fMCc").remove();
  }

  Future<void> kisiGuncelle() async
  {
    var guncelBilgi = HashMap<String, dynamic>();
    guncelBilgi["kisi_ad"] = "Yeni Mehmet";
    guncelBilgi["kisi_yas"] = 99;
    refKisiler.child("-NdG8mgyeDfYoo8x3VGS").update(guncelBilgi);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //kisiEkle();
    //kisiSil();
    kisiGuncelle();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Firebase Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}

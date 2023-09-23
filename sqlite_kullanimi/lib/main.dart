import 'package:flutter/material.dart';
import 'package:sqlite_kullanimi/Kisiler.dart';
import 'package:sqlite_kullanimi/KisilerDAO.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  Future<void> kisileriGoster() async
  {
    var liste = await KisilerDAO().kisilerListele();

    for(Kisiler K in liste)
    {
      print("***** REHBER *****\n");
      print("Kişi ID: ${K.kisi_id}");
      print("Kişi Ad: ${K.kisi_adi}");
      print("Kişi Yaş: ${K.kisi_yas}");
    }

  }

  Future<void> kisiEkle() async
  {
    await KisilerDAO().kisiEkle("Ece", 54);
  }
  Future<void> kisiSil() async
  {
    await KisilerDAO().kisiSil(3);
  }

  Future<void> kisiGuncelle() async
  {
    await KisilerDAO().kisiGuncelle(4,"Yeni Ece", 99);
  }


  Future<void> kisiGetir() async
  {
    var kisi = await KisilerDAO().kisiGetir(4);

      print("***** Kişi Getir *****\n");
      print("Kişi ID: ${kisi.kisi_id}");
      print("Kişi Ad: ${kisi.kisi_adi}");
      print("Kişi Yaş: ${kisi.kisi_yas}");
  }



  @override
  void initState() {
    super.initState();
    //kisiEkle();
    //kisiSil();
    //kisiGuncelle();
    kisiGetir();
    kisileriGoster();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Deneme"),
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

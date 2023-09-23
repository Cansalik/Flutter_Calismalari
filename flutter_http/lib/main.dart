import 'package:flutter/material.dart';
import 'package:flutter_http/Kisiler.dart';
import 'package:flutter_http/KisilerCevap.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:dio/dio.dart';

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


  List<Kisiler> parseKisilerCevap(String Cevap)
  {
    /*var jsonVeri = json.decode(Cevap);
    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);
    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;*/
    return KisilerCevap.fromJson(json.decode(Cevap)).kisilerListesi;
  }

  Future<List<Kisiler>> tumKisiler() async
  {
    var url = Uri.parse("https://nesetsalik.com/test/tum_kisiler.php");
    var cevap = await Uri.http(get(url) as String);
    return parseKisilerCevap(cevap.authority);
  }

  Future<List<Kisiler>> kisilerAra(String aramaKelime) async
  {
    var url = Uri.parse("https://nesetsalik.com/test/tum_kisiler_arama.php");
    var veri = {"kisi_ad":aramaKelime};
    var cevap = await Uri.http(post(url,body: veri) as String);
    return parseKisilerCevap(cevap.authority);
  }

  Future<void> kisiSil(int kisiId) async
  {
    var url = Uri.parse("https://nesetsalik.com/test/delete_kisiler.php");
    var veri = {"kisi_id":kisiId.toString()};
    var cevap = await Uri.http(post(url,body: veri) as String);
    print("Silme İşlemi: ${cevap.authority}");
  }

  Future<void> kisiEkle(String kisi_ad, String kisi_tel) async
  {
    var url = Uri.parse("https://nesetsalik.com/test/insert_kisiler.php");
    var veri = {"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await Uri.http(post(url,body: veri) as String);
    print("Ekle İşlemi: ${cevap.authority}");
  }

  Future<void> kisiGuncelle(int kisi_id,String kisi_ad, String kisi_tel) async
  {
    var url = Uri.parse("https://nesetsalik.com/test/update_kisiler.php");
    var veri = {"kisi_id":kisi_id.toString(),"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await Uri.http(post(url,body: veri) as String);
    print("Güncelleme İşlemi: ${cevap.authority}");
  }


  Future<void> kisileriGoster() async
  {
    var liste = await kisilerAra("a");

    for(var k in liste)
    {
      print("*********");
      print("Kişi ID: ${k.kisi_id}");
      print("Kişi Ad: ${k.kisi_ad}");
      print("Kişi Tel: ${k.kisi_tel}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //kisileriGoster();
    //kisiSil(2);
    //kisiEkle("kisi_ad", "kisi_tel");
    kisiGuncelle(2, "deneme", "54654315");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("HTTP Procces"),
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

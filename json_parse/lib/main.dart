import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parse/Filmler.dart';
import 'package:json_parse/FilmlerCevap.dart';
import 'package:json_parse/Kisiler.dart';
import 'package:json_parse/KisilerCevap.dart';
import 'package:json_parse/Mesajlar.dart';

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

  void mesajParse()
  {
    String strVeri = '{ "mesajlar" : { "mesaj_kod" : 1,"mesaj_icerik" : "başarılı"  } }';
    var jsonVeri = json.decode(strVeri);
    var jsonNesne = jsonVeri["mesajlar"];

    var mesaj = Mesajlar.fromJson(jsonNesne);

    print("Mesaj Kodu: ${mesaj.mesaj_kod}");
    print("Mesaj İçerik: ${mesaj.mesaj_icerik}");

  }


  void kisilerParse()
  {
    String strVeri = '{"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"12312312"}'
        ',{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"912318212"}]}';

    var jsonVeri = jsonDecode(strVeri);
    var jsonArray = jsonVeri["kisiler"] as List;

    List<Kisiler> kisilerListesi = jsonArray.map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi)).toList();

    for(var k in kisilerListesi)
    {
      print("******************");
      print("Kisi ID: ${k.kisi_id}");
      print("Kisi Ad: ${k.kisi_ad}");
      print("Kisi Tel: ${k.kisi_tel}");
    }
  }


  void kisilerCevapParse()
  {
    String strVeri = '{"success":1,"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"12312312"},'
        '{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"912318212"}]}';

    var jsonVeri = json.decode(strVeri);
    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);

    print("Success: ${kisilerCevap.success}");

    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;

    for(var k in kisilerListesi)
    {
      print("*************");
      print("Kişi ID: ${k.kisi_id}");
      print("Kişi Ad: ${k.kisi_ad}");
      print("Kişi Tel: ${k.kisi_tel}");
    }
  }


  void filmlerCevapParse()
  {
    String strVeri = '{"success":1,"filmler":[{"film_id":"1","film_ad":"Interstellar"'
        ',"film_yil":"2015","film_resim":"interstellar.png",'
        '"kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},'
        '"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},'
        '{"film_id":"3","film_ad":"The Pianist","film_yil":"2002","film_resim":"thepianist.png",'
        '"kategori":{"kategori_id":"3","kategori_ad":"Drama"},'
        '"yonetmen":{"yonetmen_id":"4","yonetmen_ad":"Roman Polanski"}}]}';

    var jsonVeri = json.decode(strVeri);

    var filmlerCevap = FilmlerCevap.fromJson(jsonVeri);

    int success = filmlerCevap.success;

    List<Filmler> filmlerListesi = filmlerCevap.filmlerListesi;
    
    print("Success: $success");

    for(var f in filmlerListesi)
    {
      print("*************");
      print("Film ID: ${f.film_id}");
      print("Film Ad: ${f.film_ad}");
      print("Film Yıl: ${f.film_yil}");
      print("Film Resim: ${f.film_resim}");
      print("Film Kategori: ${f.kategori.kategori_ad}");
      print("Film Yönetmen: ${f.yonetmen.yonetmen_ad}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //mesajParse();
    //kisilerParse();
    //kisilerCevapParse();
    filmlerCevapParse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Json Deneme"),
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

import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:kisiler_uygulamasi/main.dart';

class KisiKayitSayfa extends StatefulWidget {
  const KisiKayitSayfa({Key? key}) : super(key: key);

  @override
  State<KisiKayitSayfa> createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {

  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> kayit(String kisi_ad, String kisi_tel) async
  {
    var bilgi = HashMap<String, dynamic>();
    bilgi["kisi_id"] = "";
    bilgi["kisi_ad"] = kisi_ad;
    bilgi["kisi_tel"] = kisi_tel;
    refKisiler.push().set(bilgi);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        title: Text("Kişi Ekle"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0,right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox( width: 200,height:200,child: Image.asset("assets/resimler/add-user.png")),
              TextField(
                controller: tfKisiAdi,
                decoration: InputDecoration(
                    labelText: "Kişi Adı"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: tfKisiTel,
                decoration: InputDecoration(
                    labelText: "Kişi Nuamrası"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()
        {
          kayit(tfKisiAdi.text, tfKisiTel.text);
        },
        backgroundColor: Colors.deepOrange[300],
        tooltip: "Kaydet",
        icon: Icon(Icons.save),
        label: Text("Kaydet"),
      ),
    );
  }
}

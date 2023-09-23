import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:okul_uygulamasi/main.dart';

class NotKayitSayfa extends StatefulWidget {
  const NotKayitSayfa({Key? key}) : super(key: key);

  @override
  State<NotKayitSayfa> createState() => _NotKayitSayfaState();
}

class _NotKayitSayfaState extends State<NotKayitSayfa> {

  var tfDersAdi = TextEditingController();
  var tfNot1 = TextEditingController();
  var tfNot2 = TextEditingController();

  var refNotlar = FirebaseDatabase.instance.ref().child("notlar");

  Future<void> Kayit(String ders_adi, int not1, int not2) async
  {
    var bilgi = HashMap<String, dynamic>();
    bilgi["not_id"] = "";
    bilgi["ders_adi"] = ders_adi;
    bilgi["not1"] = not1;
    bilgi["not2"] = not2;
    refNotlar.push().set(bilgi);

    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Ders - Not Kayıt"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50.0, left: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                  width: 275,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Köşe yarıçapı
                    child: Image.asset(
                      "assets/resimler/add.png",
                      width: 100, // Görüntünün genişliği
                      height: 175, // Görüntünün yüksekliği
                      fit: BoxFit.contain, // Görüntünün sığdırılma yöntemi (sıkıştır, kes, kapla, vs.)
                    ),
                  )
              ),
              TextField(
                controller: tfDersAdi,
                decoration: InputDecoration(
                  labelText: "Ders Adı",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: tfNot1,
                decoration: InputDecoration(
                  labelText: "1. Not",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: tfNot2,
                decoration: InputDecoration(
                  labelText: "2. Not",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()
        {
         Kayit(tfDersAdi.text, int.parse(tfNot1.text), int.parse(tfNot2.text));
        },
        backgroundColor: Colors.deepOrangeAccent,
        tooltip: 'Kaydet',
        icon: Icon(Icons.save),
        label: Text("Kaydet"),
      ),
    );
  }
}

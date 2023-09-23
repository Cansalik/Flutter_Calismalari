import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/KisiDetaySayfa.dart';
import 'package:kisiler_uygulamasi/KisiKayitSayfa.dart';
import 'package:kisiler_uygulamasi/Kisiler.dart';
import 'package:kisiler_uygulamasi/KisilerDAO.dart';

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
      home:Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;
  String aramKelime = "";

  Future<List<Kisiler>> tumKisileriGoster() async
  {
    var kisilerListesi = await KisilerDAO().tumKisiler();
    return kisilerListesi;
  }

  Future<List<Kisiler>> aramaYap(String aramaKelimesi) async
  {
    var kisilerListesi = await KisilerDAO().kisiArama(aramaKelimesi);
    return kisilerListesi;
  }

  Future<void> sil(int kisi_id) async
  {
    await KisilerDAO().kisiSil(kisi_id);
    setState(() {

    });
  }

  Future<bool> uygulamayiKapat() async
  {
    await exit(0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrange[400],
        title: aramaYapiliyorMu ?
            TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                labelText: "Kişi Adı..",
              ),
              onChanged: (aramaSonucu)
              {
                print("Arama Sonucu: $aramaSonucu");
                setState(() {
                  aramKelime = aramaSonucu;
                });
              },
            )
            : Text("Kişiler"),
        actions: [
          aramaYapiliyorMu ?
              IconButton(
                icon: Icon(Icons.cancel,color: Colors.white,),
                onPressed: ()
                {
                  setState(() {
                    aramaYapiliyorMu = false;
                    aramKelime = "";
                  });
                },
              )
              : IconButton(
                icon: Icon(Icons.search,color: Colors.white,),
                onPressed: ()
                {
                  setState(() {
                    aramaYapiliyorMu = true;
                  });
                },
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: uygulamayiKapat,
        child: FutureBuilder<List<Kisiler>>(
          future: aramaYapiliyorMu ? aramaYap(aramKelime) : tumKisileriGoster(),
          builder: (context,snapshot)
          {
            if(snapshot.hasData)
            {
              var kisilerListesi = snapshot.data;

              return ListView.builder(
                itemCount: kisilerListesi!.length,
                itemBuilder: (context, index)
                {
                  var kisi = kisilerListesi[index];
                  return GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => KisiDetaySayfa(kisi: kisi,)));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 50,height: 50,child: Image.asset("assets/resimler/people.png")),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(kisi.kisi_ad,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                  Text("${kisi.kisi_tel}",style: TextStyle(fontSize: 16,color: Colors.blue),),
                                ],
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.delete,color: Colors.red[400],),
                              onPressed: ()
                              {
                                sil(kisi.kisi_id);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            else
            {
              return Center(
                child: Column(
                  children: [
                    Text("Hata"),
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => KisiKayitSayfa()));
        },
        backgroundColor: Colors.deepOrange[300],
        tooltip: "Kişi Ekle",
        child: Icon(Icons.person_add),
      ),
    );
  }
}

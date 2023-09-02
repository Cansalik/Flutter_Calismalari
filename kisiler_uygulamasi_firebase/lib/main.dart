import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/KisiDetaySayfa.dart';
import 'package:kisiler_uygulamasi/KisiKayitSayfa.dart';
import 'package:kisiler_uygulamasi/Kisiler.dart';

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

  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");


  Future<void> sil(String kisi_id) async
  {
    refKisiler.child(kisi_id).remove();
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
                onPressed:()
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
        child: StreamBuilder<DatabaseEvent>(
          stream: refKisiler.onValue,
          builder: (context,event)
          {
            if(event.hasData)
            {
              var kisilerListesi = <Kisiler>[];
              var gelenDegerler = event.data!.snapshot.value as dynamic;

              if(gelenDegerler != null)
              {
                gelenDegerler.forEach((key, nesne)
                {
                  var gelenKisi = Kisiler.fromJson(key, nesne);

                  if(aramaYapiliyorMu)
                  {
                    if(gelenKisi.kisi_ad.contains(aramKelime))
                    {
                      kisilerListesi.add(gelenKisi);
                    }
                  }
                  else
                  {
                    kisilerListesi.add(gelenKisi);
                  }
                });
              }
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

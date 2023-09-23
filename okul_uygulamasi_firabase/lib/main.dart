import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:okul_uygulamasi/NotDetaySayfa.dart';
import 'package:okul_uygulamasi/NotKayitSayfa.dart';
import 'package:okul_uygulamasi/Notlar.dart';

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
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var refNotlar = FirebaseDatabase.instance.ref().child("notlar");

  Future<bool> uygulamaCikis() async
  {
    await exit(0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()
          {
            uygulamaCikis();
          },
        ),
        backgroundColor: Colors.deepOrangeAccent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Not Uygulaması",style: TextStyle(color: Colors.white,fontSize: 16),),
            StreamBuilder<DatabaseEvent>(
                stream: refNotlar.onValue,
                builder: (context, event)
                {
                  if(event.hasData)
                  {
                    var notlarListesi = <Notlar>[];
                    var gelenDegerler = event.data!.snapshot.value as dynamic;
                    if(gelenDegerler!=null)
                    {
                      gelenDegerler.forEach((key, nesne)
                      {
                        var gelenNot = Notlar.fromJson(key, nesne);
                        notlarListesi.add(gelenNot);
                      });
                    }
                    late double ortalama = 0.0;

                    if(!notlarListesi!.isEmpty)
                    {
                      late double toplam = 0.0;
                      for(var not in notlarListesi)
                      {
                        toplam = toplam + (not.not1 + not.not2) /2 ;
                      }
                      ortalama = toplam / notlarListesi.length;
                    }
                    return Text("Genel Ortalama : ${ortalama.toInt()}",style: TextStyle(color: Colors.white,fontSize: 14),);
                  }
                  else
                  {
                    return Text("Ortalama : 0",style: TextStyle(color: Colors.white,fontSize: 14),);
                  }
                }
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: uygulamaCikis,
        child: StreamBuilder<DatabaseEvent>(
          stream: refNotlar.onValue,
          builder: (context, event)
          {
            if(event.hasData)
            {
              var notlarListesi = <Notlar>[];
              var gelenDegerler = event.data!.snapshot.value as dynamic;
              if(gelenDegerler!=null)
              {
                gelenDegerler.forEach((key, nesne)
                {
                  var gelenNot = Notlar.fromJson(key, nesne);
                  notlarListesi.add(gelenNot);
                });
              }
              return ListView.builder(
                itemCount: notlarListesi!.length,
                itemBuilder: (context, index)
                {
                  var not = notlarListesi[index];
                  return GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotDetaySayfa(not: not,)));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(not.ders_adi,style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(not.not1.toString()),
                            Text(not.not2.toString()),
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
              return Center();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotKayitSayfa()));
        },
        backgroundColor: Colors.deepOrangeAccent,
        tooltip: 'Ders ve Not Kayıt',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:filmler_uygulamasi/FilmlerSayfa.dart';
import 'package:filmler_uygulamasi/Kategoriler.dart';
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
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var refKategoriler = FirebaseDatabase.instance.ref().child("kategoriler");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("SEEN Sinemaları - Kategoriler"),
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: refKategoriler.onValue,
        builder: (context, event)
        {
          if(event.hasData)
          {
            var listeKategori = <Kategoriler>[];
            var gelenDegerler = event.data!.snapshot.value as dynamic;
            if(gelenDegerler!=null)
            {
              gelenDegerler.forEach((key, nesne)
              {
                var gelenKategori = Kategoriler.fromJson(key, nesne);
                listeKategori.add(gelenKategori);
              });
            }
            return ListView.builder(
              itemCount: listeKategori!.length,
              itemBuilder: (context, index)
              {
                var kategori = listeKategori[index];
                return GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FilmlerSayfa(kategori: kategori)));
                  },
                  child: Card(
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(kategori.kategori_ad),
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
        }

      ),
    );
  }
}

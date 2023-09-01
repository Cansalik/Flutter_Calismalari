import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sozluk_uygulamasi/DetaySayfa.dart';
import 'package:sozluk_uygulamasi/Kelimeler.dart';

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


  bool aramaYapiliyorMu = false;
  late String aramaKelimesi = "";

  var refKelimeler = FirebaseDatabase.instance.ref().child("kelimeler");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: aramaYapiliyorMu ?
              TextField(
                decoration: InputDecoration(hintText: "Arancak Kelime"),
                onChanged: (aramaSonucu)
                {
                  print("Arama Sonucu: $aramaSonucu");
                  setState(() {
                    aramaKelimesi = aramaSonucu;
                  });
                },
              )
            : Text("Sözlük Uygulaması"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: ()
            {
              setState(() {
                aramaYapiliyorMu = false;
                aramaKelimesi = "";
              });
            },
          )
          : IconButton(
            icon: Icon(Icons.search),
            onPressed: ()
            {
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          ),
        ],
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: refKelimeler.onValue,
        builder: (context, event)
        {
          if(event.hasData)
          {
            var kelimeList = <Kelimeler>[];
            var gelenDegerler = event.data!.snapshot.value as dynamic;
            if(gelenDegerler!=null)
            {
              gelenDegerler.forEach((key, nesne)
              {
                var gelenKelime = Kelimeler.fromJson(key, nesne);
                if(aramaYapiliyorMu)
                {
                  if(gelenKelime.ingilizce.contains(aramaKelimesi))
                  {
                    kelimeList.add(gelenKelime);
                  }
                }
                else
                {
                  kelimeList.add(gelenKelime);
                }
              });
            }
            return ListView.builder(
              itemCount: kelimeList!.length,
              itemBuilder: (context,indeks)
              {
                var kelime = kelimeList[indeks];
                return GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfa(kelime: kelime,)));
                  },
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(kelime.ingilizce,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(kelime.turkce),
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

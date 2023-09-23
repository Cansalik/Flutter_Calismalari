import 'package:flutter/material.dart';
import 'package:sozluk_uygulamasi/DetaySayfa.dart';
import 'package:sozluk_uygulamasi/Kelimeler.dart';
import 'package:sozluk_uygulamasi/KelimelerDAO.dart';

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


  bool aramaYapiliyorMu = false;
  late String aramaKelimesi = "";


  Future<List<Kelimeler>> tumunuGoster() async
  {
    var kelimeListesi = await KelimelerDAO().tumKelimeler();
    return kelimeListesi;
  }


  Future<List<Kelimeler>> kelimeAra(String arananKelime) async
  {
    var aranan = await KelimelerDAO().kelimeAra(arananKelime);
    return aranan;
  }

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
      body: FutureBuilder<List<Kelimeler>>(
        future: aramaYapiliyorMu ? kelimeAra(aramaKelimesi) : tumunuGoster(),
        builder: (context, snapshot)
        {
          if(snapshot.hasData)
          {
            var kelimeList = snapshot.data;
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

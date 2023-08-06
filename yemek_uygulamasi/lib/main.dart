import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/YemekDetay.dart';
import 'package:yemek_uygulamasi/Yemekler.dart';

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

  Future<List<Yemekler>> yemekleriGetir() async {
    var yemekListesi = <Yemekler>[];

    var Y1 = Yemekler(1, "Köfte", "kofte.png", 15.99);
    var Y2 = Yemekler(1, "Ayran", "ayran.png", 2.0);
    var Y3 = Yemekler(1, "Fanta", "fanta.png", 3.0);
    var Y4 = Yemekler(1, "Makarna", "makarna.png", 14.99);
    var Y5 = Yemekler(1, "Kadayıf", "kadayif.png", 8.50);
    var Y6 = Yemekler(1, "Baklava", "baklava.png", 15.99);

    yemekListesi.add(Y1);
    yemekListesi.add(Y2);
    yemekListesi.add(Y3);
    yemekListesi.add(Y4);
    yemekListesi.add(Y5);
    yemekListesi.add(Y6);

    return yemekListesi;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
            child: Text("Neş-Et Menü",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
        ),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context, snapshot)
        {
          if(snapshot.hasData)
          {
            var yemekListesi = snapshot.data;
            return ListView.builder(
              itemCount: yemekListesi!.length,
              itemBuilder: (context, indeks)
              {
                var yemek = yemekListesi[indeks];
                return GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => YemekDetay(yemek: yemek,)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width: 150,height: 150,child: Image.asset("resimler/${yemek.yemek_resim_adi}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(yemek.yemek_adi,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            SizedBox(height: 50,),
                            Text("${yemek.yemek_fiyat} \u{20BA}",style: TextStyle(fontSize: 25,color: Colors.blue),),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
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
    );
  }
}

import 'package:film_katalogu/FilmDetay.dart';
import 'package:film_katalogu/Filmler.dart';
import 'package:flutter/material.dart';

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

  Future<List<Filmler>> filmleriGetir() async
  {
    var filmlerListesi = <Filmler>[];
    var F1 = Filmler(1, "Anadoluda", "anadoluda.png", 32.00, 15.99);
    var F2 = Filmler(2, "Django", "django.png", 19.99, 8.99);
    var F3 = Filmler(3, "Inception", "inception.png",15.99, 7.99);
    var F4 = Filmler(4, "Interstellar", "interstellar.png", 44.99, 21.99);
    var F5 = Filmler(5, "The Hateful Eight", "thehatefuleight.png", 12.99, 6.99);
    var F6 = Filmler(6, "The Pianist", "thepianist.png", 35.99, 17.99);

    filmlerListesi.add(F1);
    filmlerListesi.add(F2);
    filmlerListesi.add(F3);
    filmlerListesi.add(F4);
    filmlerListesi.add(F5);
    filmlerListesi.add(F6);

    return filmlerListesi;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text("SEEN Sinemaları",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
        ),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context, snapshot)
        {
          if(snapshot.hasData)
          {
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              itemCount: filmlerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemBuilder: (context, indeks) {
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FilmDetay(film: film)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("resimler/${film.film_Resim_Adi}"),
                        ),
                        Text("${film.film_Adi}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${film.film_Kiralik_Fiyat} \u{20BA}", style: TextStyle(fontSize: 16,color: Colors.lightBlue),),
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
        }
      ),
    );
  }
}

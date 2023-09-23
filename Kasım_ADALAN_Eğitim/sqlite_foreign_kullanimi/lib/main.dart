import 'package:flutter/material.dart';
import 'package:sqlite_foreign_kullanimi/Filmler.dart';
import 'package:sqlite_foreign_kullanimi/FilmlerDAO.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  Future<void> goster() async
  {
    var liste = await FilmlerDAO().tumFilmler();

    for(Filmler F in liste)
    {
      print("***** ${F.film_id}. FİLM *****");
      print("Film Adı      : ${F.film_ad}");
      print("Film Yılı     : ${F.film_yil}");
      print("Film Resim    : ${F.film_resim}");
      print("Film Kategori : ${F.kategori.kategori_ad}");
      print("Film Yönetmen : ${F.yonetmen.yonetmen_ad}");
    }
  }

  @override
  void initState() {
    super.initState();
    goster();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Foreign Key"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}

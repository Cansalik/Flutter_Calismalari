import 'package:filmler_uygulamasi/Filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {

  late Filmler film;


  DetaySayfa({ required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("${widget.film.film_ad} Filmi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network("https://nesetsalik.com/images/${widget.film.film_resim}"),
            Text("${widget.film.film_yil.toString()}",style: TextStyle(fontSize: 30),),
            Text("${widget.film.yonetmen_ad}",style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}

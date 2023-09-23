import 'package:film_katalogu/Filmler.dart';
import 'package:flutter/material.dart';

class FilmDetay extends StatefulWidget {

  Filmler film;


  FilmDetay({ required this.film});

  @override
  State<FilmDetay> createState() => _FilmDetayState();
}

class _FilmDetayState extends State<FilmDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text("${widget.film.film_Adi} Detay",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_Resim_Adi}"),
            Text("Satın Almak için: ${widget.film.film_Satilik_Fiyat} \u{20BA}", style: TextStyle(fontSize: 24,color: Colors.purpleAccent),),
            Text("Kiralamak için: ${widget.film.film_Kiralik_Fiyat} \u{20BA}", style: TextStyle(fontSize: 24,color: Colors.purpleAccent),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black45,
                ),
                child: Text("SATIN AL",style: TextStyle(color: Colors.white),),
                onPressed: ()
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Film Satın Alındı.", style: TextStyle(color: Colors.white),),
                      backgroundColor: Colors.pinkAccent,
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                ),
                child: Text("KİRALA",style: TextStyle(color: Colors.white),),
                onPressed: ()
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Film Kiralandı.", style: TextStyle(color: Colors.white),),
                      backgroundColor: Colors.pinkAccent,
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:filmler_uygulamasi/DetaySayfa.dart';
import 'package:filmler_uygulamasi/Filmler.dart';
import 'package:filmler_uygulamasi/FilmlerDAO.dart';
import 'package:filmler_uygulamasi/Kategoriler.dart';
import 'package:flutter/material.dart';

class FilmlerSayfa extends StatefulWidget {

  late Kategoriler kategori;

  FilmlerSayfa({required this.kategori});

  @override
  State<FilmlerSayfa> createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {

  Future<List<Filmler>> filmleriGoster(int kategori_id) async
  {
    var filmlerListesi = await FilmlerDAO().filmGetir(kategori_id);
    return filmlerListesi;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Seçilen Kategori: ${widget.kategori.kategori_ad} / ${widget.kategori.kategori_id.toString()}"),
      ),
      body: FutureBuilder<List<Filmler>>(
          future: filmleriGoster(widget.kategori.kategori_id),
          builder: (context, snapshot)
          {
            if(snapshot.hasData)
            {var filmlerListesi = snapshot.data;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5,
                ),
                itemCount: filmlerListesi!.length,
                itemBuilder: (context, index)
                {
                  var film = filmlerListesi[index];
                  return GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(film: film,)));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/resimler/${film.film_resim}"),
                          ),
                          Text(film.film_ad,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            else
            {
              return Center(child: Text("Veri yok")); // Veri yok durumu
            }
          }
      ),
    );
  }
}

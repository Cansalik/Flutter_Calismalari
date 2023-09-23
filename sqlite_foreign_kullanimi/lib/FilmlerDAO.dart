import 'package:sqlite_foreign_kullanimi/Filmler.dart';
import 'package:sqlite_foreign_kullanimi/Kategoriler.dart';
import 'package:sqlite_foreign_kullanimi/VeritabaniYardimcisi.dart';
import 'package:sqlite_foreign_kullanimi/Yonetmenler.dart';

class FilmlerDAO
{

  Future<List<Filmler>> tumFilmler() async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM filmler, kategoriler, yonetmenler WHERE filmler.kategori_id = kategoriler.kategori_id AND filmler.yonetmen_id = yonetmenler.yonetmen_id");

    return List.generate(maps.length, (i)
    {
      var satir = maps[i];

      var Kategori = Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      var Yonetmen = Yonetmenler(satir["yonetmen_id"], satir["yonetmen_ad"]);
      var Film = Filmler(satir["film_id"], satir["film_ad"], satir["film_yil"], satir["film_resim"], Kategori, Yonetmen);

      return Film;

    });

  }

}
import 'package:filmler_uygulamasi/Filmler.dart';
import 'package:filmler_uygulamasi/Kategoriler.dart';
import 'package:filmler_uygulamasi/VeritabaniYardimcisi.dart';
import 'package:filmler_uygulamasi/Yonetmenler.dart';

class FilmlerDAO
{
  Future<List<Filmler>> filmGetir(int kategori_id) async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM filmler,kategoriler,yonetmenler WHERE"
        " filmler.kategori_id = kategoriler.kategori_id AND filmler.yonetmen_id = yonetmenler.yonetmen_id"
        " AND filmler.kategori_id = $kategori_id");

    return List.generate(maps.length, (i)
    {
      var satir = maps[i];
      
      var K = Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      var Y = Yonetmenler(satir["yonetmen_id"], satir["yonetman_ad"]);
      var F = Filmler(satir["film_id"], satir["film_ad"], satir["film_yil"], satir["film_resim"], K, Y);

      return F;
    });
  }
}
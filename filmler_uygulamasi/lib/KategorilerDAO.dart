import 'package:filmler_uygulamasi/Kategoriler.dart';
import 'package:filmler_uygulamasi/VeritabaniYardimcisi.dart';

class KategorilerDAO
{
  Future<List<Kategoriler>> tumKategoriler() async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> Maps = await db.rawQuery("SELECT * FROM kategoriler");

    return List.generate(Maps.length, (index)
    {
      var satir = Maps[index];

      return Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
    });
  }


}
import 'package:bayrak_quiz_uygulamasi/Bayraklar.dart';
import 'package:bayrak_quiz_uygulamasi/VeritabaniYardimcisi.dart';

class BayraklarDAO
{

  Future<List<Bayraklar>> rasgeleDogruGetir() async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> Maps = await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 10");

    return List.generate(Maps.length, (i)
    {
      var satir = Maps[i];

      return Bayraklar(satir["bayrak_id"],satir["bayrak_ad"],satir["bayrak_resim"]);
    });
  }

  Future<List<Bayraklar>> rasgeleYanlisGetir(int bayrak_Id) async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> Maps = await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_Id ORDER BY RANDOM() LIMIT 3");

    return List.generate(Maps.length, (i)
    {
      var satir = Maps[i];

      return Bayraklar(satir["bayrak_id"],satir["bayrak_ad"],satir["bayrak_resim"]);
    });
  }


}
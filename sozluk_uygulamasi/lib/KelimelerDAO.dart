import 'package:sozluk_uygulamasi/Kelimeler.dart';
import 'package:sozluk_uygulamasi/VeritabaniYardimcisi.dart';

class KelimelerDAO
{
  Future<List<Kelimeler>> tumKelimeler() async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> Maps = await db.rawQuery("SELECT * FROM kelimeler");

    return List.generate(Maps.length, (index)
    {
      var satir = Maps[index];

      return Kelimeler(satir["kelime_id"], satir["turkce"], satir["ingilizce"]);
    });
  }


  Future<List<Kelimeler>> kelimeAra(String arananKelime) async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> Maps = await db.rawQuery("SELECT * FROM kelimeler WHERE ingilizce like '%$arananKelime%'");

    return List.generate(Maps.length, (index)
    {
      var satir = Maps[index];

      return Kelimeler(satir["kelime_id"], satir["turkce"], satir["ingilizce"]);
    });
  }

}
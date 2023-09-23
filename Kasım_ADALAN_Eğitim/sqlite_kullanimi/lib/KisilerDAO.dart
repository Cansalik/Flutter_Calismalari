import 'package:sqlite_kullanimi/Kisiler.dart';
import 'package:sqlite_kullanimi/VeritabaniYardimcisi.dart';

class KisilerDAO
{


  Future<List<Kisiler>> kisilerListele() async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();

    List<Map<String,dynamic>> maps  = await db.rawQuery("SELECT * FROM kisiler");

    return List.generate(maps.length, (i)
    {
      var satir = maps[i];

      return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
    });
  }

  Future<void> kisiEkle(String kisi_Ad, int kisi_Yas) async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();

    var bilgiler = Map<String,dynamic>();
    bilgiler["kisi_ad"] = kisi_Ad;
    bilgiler["kisi_yas"] = kisi_Yas;

    await db.insert("kisiler", bilgiler);

  }
  
  Future<void> kisiSil(int kisi_Id) async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();

    await db.delete("kisiler", where: "kisi_id = ?", whereArgs: [kisi_Id]);
  }

  Future<void> kisiGuncelle(int kisi_Id, String kisi_Ad, int kisi_Yas) async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();

    var bilgiler = Map<String,dynamic>();
    bilgiler["kisi_ad"] = kisi_Ad;
    bilgiler["kisi_yas"] = kisi_Yas;

    await db.update("kisiler", bilgiler, where: "kisi_id = ?", whereArgs: [kisi_Id]);
  }

  Future<Kisiler> kisiGetir(int kisi_Id) async
  {
    var db = await VeritabaniYardimcisi.veritabaniErisimi();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_id = $kisi_Id");

    var satir = maps[0];

    return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
  }

}
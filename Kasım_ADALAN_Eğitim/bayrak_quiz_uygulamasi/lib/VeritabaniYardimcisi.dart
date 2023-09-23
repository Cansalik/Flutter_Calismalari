import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi
{
  static final String veritabaniAdi = "bayrakquiz.sqlite";

  static Future<Database> veritabaniErisim() async
  {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

    if(await databaseExists(veritabaniYolu))
    {
      print("Veritabanı Kopyalandı");
    }
    else
    {
      //assets'den veritabanının alınması.
      ByteData data = await rootBundle.load("assets/veritabani/$veritabaniAdi");

      //Veritabanın Kopyalama için Byte Dönüşümü.
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      //Veritabanın Kopyalanması.
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("Kopyalandı");
    }

    //Veritabanı Açılıyor.
    return openDatabase(veritabaniYolu);
  }
}
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi
{
  static final String veritabaniAdi = "filmler.sqlite";

  static Future<Database> veritabaniErisimi() async
  {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

    if(await databaseExists(veritabaniYolu))
    {
      print("Veritabanı Zaten var. Kopyalamaya Gerek Yoktur.");
    }
    else
    {
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes,data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veritabanı kopyalandı");
    }

    return openDatabase(veritabaniYolu);
  }
}
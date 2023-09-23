import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class databaseAssistant{

  static final String databaseName = "hastane_sistem.sqlite";

  static Future<Database> databaseAccess() async {
    String veritabaniYolu = join(await getDatabasesPath(), databaseName);

    if(await databaseExists(veritabaniYolu)){//Veritabanı var mı yok mu kontrolü
      print("Veri tabanı zaten var.Kopyalamaya gerek yok");
    }else{
      //assetten veritabanının alınması
      ByteData data = await rootBundle.load("assets/dataBase/$databaseName");
      //Veritabanının kopyalama için byte dönüşümü
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      //Veritabanının kopyalanması.
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veri tabanı kopyalandı");
    }
    //Veritabanını açıyoruz.
    return openDatabase(veritabaniYolu);
  }

}




import 'package:json_parse/Kisiler.dart';

class KisilerCevap
{
  late int success;
  late List<Kisiler> kisilerListesi;

  KisilerCevap(this.success, this.kisilerListesi);

  factory KisilerCevap.fromJson(Map<String, dynamic> json)
  {
    var jsonArray = json["kisiler"] as List;
    List<Kisiler> kisilerListesi = jsonArray.map((jsonArrayListesi) => Kisiler.fromJson(jsonArrayListesi)).toList();
    return KisilerCevap(json["success"] as int, kisilerListesi);
  }
}
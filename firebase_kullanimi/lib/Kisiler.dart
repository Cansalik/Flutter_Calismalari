class Kisiler
{
  late String kisi_ad;
  late int kisi_id;

  Kisiler(this.kisi_ad, this.kisi_id);

  factory Kisiler.fromJson(Map<dynamic,dynamic> json)
  {
    return Kisiler(json["kisi_ad"] as String, json["kisi_id"] as int);
  }
}
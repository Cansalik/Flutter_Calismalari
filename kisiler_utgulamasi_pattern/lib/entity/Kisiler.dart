class Kisiler
{
  late String kisi_id;
  late String kisi_ad;
  late String kisi_tel;

  Kisiler({ required this.kisi_id, required this.kisi_ad, required this.kisi_tel});

  factory Kisiler.fromjson(String key, Map<dynamic,dynamic> json)
  {
    return Kisiler(
        kisi_id: key,
        kisi_ad: json["kisi_ad"] as String,
        kisi_tel: json["kisi_tel"] as String);
  }

}
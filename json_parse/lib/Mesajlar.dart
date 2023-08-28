class Mesajlar
{
  late int mesaj_kod;
  late String mesaj_icerik;

  Mesajlar(this.mesaj_kod, this.mesaj_icerik);

  factory Mesajlar.fromJson(Map<String, dynamic> json)
  {
    return Mesajlar(json["mesaj_kod"] as int, json["mesaj_icerik"] as String);
  }
}
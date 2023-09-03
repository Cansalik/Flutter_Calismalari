class Contacts
{
  late String contact_id;
  late String contact_name;
  late String contact_phone;

  Contacts({ required this.contact_id, required this.contact_name, required this.contact_phone});

  factory Contacts.fromjson(String key, Map<dynamic,dynamic> json)
  {
    return Contacts(
        contact_id: key,
        contact_name: json["kisi_ad"] as String,
        contact_phone: json["kisi_tel"] as String);
  }

}
import 'package:firebase_database/firebase_database.dart';

class Contacts_Repositories
{

  var _contactRepo = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> contactAdd(String contact_name, String contact_phone) async
  {
    var bilgi = Map<String, dynamic>();
    bilgi["kisi_id"] = "";
    bilgi["kisi_ad"] = contact_name;
    bilgi["kisi_tel"] = contact_phone;
    _contactRepo.push().set(bilgi);
  }

  Future<void> contactUpdate(String contact_id,String contact_name, String contact_phone) async
  {
    var bilgi = Map<String, dynamic>();
    bilgi["kisi_ad"] = contact_name;
    bilgi["kisi_tel"] = contact_phone;
    _contactRepo.child(contact_id).update(bilgi);
  }


  Future<void> contactDelete(String contact_id) async
  {
    _contactRepo.child(contact_id).remove();
  }
}
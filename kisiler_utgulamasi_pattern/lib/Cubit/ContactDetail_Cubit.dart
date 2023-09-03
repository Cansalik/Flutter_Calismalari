import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Repositories/Contacts_Repositories.dart';

class ContactDetail_Cubit extends Cubit<void>
{
  ContactDetail_Cubit() : super(0);

  var kisiRepo = Contacts_Repositories();

  Future<void> update(String kisi_id,String kisi_ad, String kisi_tel) async
  {
    await kisiRepo.contactUpdate(kisi_id, kisi_ad, kisi_tel);
  }
}
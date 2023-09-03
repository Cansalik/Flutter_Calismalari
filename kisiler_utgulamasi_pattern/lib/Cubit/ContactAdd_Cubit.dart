import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Repositories/Contacts_Repositories.dart';

class ContactAdd_Cubit extends Cubit<void>
{
  ContactAdd_Cubit() : super(0);

  var _contactRepo = Contacts_Repositories();

  Future<void> add(String kisi_ad, String kisi_tel) async
  {
    await _contactRepo.contactAdd(kisi_ad, kisi_tel);
  }
}
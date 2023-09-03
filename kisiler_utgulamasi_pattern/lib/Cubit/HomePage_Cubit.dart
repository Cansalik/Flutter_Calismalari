import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Entity/Contacts.dart';
import 'package:kisiler_utgulamasi_pattern/Repositories/Contacts_Repositories.dart';

class HomePage_Cubit extends Cubit<List<Contacts>>
{
  HomePage_Cubit() : super(<Contacts>[]);

  var _contactRepo = Contacts_Repositories();
  var _refContacts = FirebaseDatabase.instance.ref().child("kisiler");


  Future<void> contactsLoad() async
  {
    _refContacts.onValue.listen((event)
    {
      var getterValues = event.snapshot.value as dynamic;

      if(getterValues!=null)
      {
        var list = <Contacts>[];
        getterValues.forEach((key, object)
        {
          var _contact = Contacts.fromjson(key, object);
          list.add(_contact);
        });
      emit(list);
      }
    });
  }

  Future<void> search(String searchWord) async
  {
    _refContacts.onValue.listen((event)
    {
      var getterValues = event.snapshot.value as dynamic;

      if(getterValues!=null)
      {
        var list = <Contacts>[];
        getterValues.forEach((key, object)
        {
          var _contact = Contacts.fromjson(key, object);
          if(_contact.contact_name.contains(searchWord))
          {
            list.add(_contact);
          }
        });
        emit(list);
      }
    });
  }

  Future<void> delete(String kisi_id) async
  {
    await _contactRepo.contactDelete(kisi_id);
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/ContactDetail_Cubit.dart';
import 'package:kisiler_utgulamasi_pattern/Entity/Contacts.dart';
import 'package:kisiler_utgulamasi_pattern/Views/HomePage.dart';

class ContactDetail_Page extends StatefulWidget {

  Contacts contact;

  ContactDetail_Page({required this.contact});

  @override
  State<ContactDetail_Page> createState() => _ContactDetail_PageState();
}

class _ContactDetail_PageState extends State<ContactDetail_Page> {

  var tfContactName = TextEditingController();
  var tfContactPhone = TextEditingController();

  @override
  void initState() {
    super.initState();
    var contact = widget.contact;
    tfContactName.text = contact.contact_name;
    tfContactPhone.text = contact.contact_phone;
  }

  Future<void> guncelle(int contact_id,String contact_name, String contact_phone) async
  {
    print("Kişi Kayıt: $contact_id - $contact_name - $contact_phone");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Detyaları"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox( width: 200,height:200,child: Image.asset("assets/images/people.png")),
              TextField(
                controller: tfContactName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  labelText: "Kişi Adı",
                ),
              ),
              TextField(
                keyboardType:TextInputType.number,
                controller: tfContactPhone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  labelText: "Kişi Telefonu",
                ),
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    child: Text("Güncelle"),
                    onPressed: ()
                    {
                      context.read<ContactDetail_Cubit>().update(widget.contact.contact_id, tfContactName.text, tfContactPhone.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

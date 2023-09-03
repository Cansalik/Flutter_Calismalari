import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/ContactAdd_Cubit.dart';
import 'package:kisiler_utgulamasi_pattern/Views/HomePage.dart';

class ContactAdd_Page extends StatefulWidget {
  const ContactAdd_Page({Key? key}) : super(key: key);

  @override
  State<ContactAdd_Page> createState() => _ContactAdd_PageState();
}

class _ContactAdd_PageState extends State<ContactAdd_Page> {

  var tfContactName = TextEditingController();
  var tfContactPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişiler"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox( width: 200,height:200,child: Image.asset("assets/images/add-user.png")),
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
                  child: Text("Kaydet"),
                    onPressed: ()
                    {
                      context.read<ContactAdd_Cubit>().add(tfContactName.text, tfContactPhone.text);
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

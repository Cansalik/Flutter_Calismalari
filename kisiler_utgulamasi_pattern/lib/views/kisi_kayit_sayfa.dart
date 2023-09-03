import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/KisiKayitCubit.dart';

class KisiKayitSayfa extends StatefulWidget {
  const KisiKayitSayfa({Key? key}) : super(key: key);

  @override
  State<KisiKayitSayfa> createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {

  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

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
              TextField(
                controller: tfKisiAd,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  labelText: "Kişi Adı",
                ),
              ),
              TextField(
                keyboardType:TextInputType.number,
                controller: tfKisiTel,
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
                      context.read<KisiKayitCubit>().kayit(tfKisiAd.text, tfKisiTel.text);
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

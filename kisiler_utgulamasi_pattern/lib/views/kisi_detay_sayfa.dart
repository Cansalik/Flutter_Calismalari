import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/KisiDetayCubit.dart';
import 'package:kisiler_utgulamasi_pattern/entity/Kisiler.dart';
import 'package:kisiler_utgulamasi_pattern/views/anasayfa.dart';

class KisiDetaySayfa extends StatefulWidget {

  Kisiler kisi;

  KisiDetaySayfa({required this.kisi});

  @override
  State<KisiDetaySayfa> createState() => _KisiDetaySayfaState();
}

class _KisiDetaySayfaState extends State<KisiDetaySayfa> {

  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfKisiAd.text = kisi.kisi_ad;
    tfKisiTel.text = kisi.kisi_tel;
  }

  Future<void> guncelle(int kisi_id,String kisi_ad, String kisi_tel) async
  {
    print("Kişi Kayıt: $kisi_id - $kisi_ad - $kisi_tel");
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
                    child: Text("Güncelle"),
                    onPressed: ()
                    {
                      context.read<KisiDetayCubit>().guncelle(widget.kisi.kisi_id, tfKisiAd.text, tfKisiTel.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
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

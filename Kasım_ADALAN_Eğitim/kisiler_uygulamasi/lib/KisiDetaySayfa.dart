import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/Kisiler.dart';
import 'package:kisiler_uygulamasi/KisilerDAO.dart';
import 'package:kisiler_uygulamasi/main.dart';

class KisiDetaySayfa extends StatefulWidget {

  late Kisiler kisi;

  KisiDetaySayfa({required this.kisi});

  @override
  State<KisiDetaySayfa> createState() => _KisiDetaySayfaState();
}

class _KisiDetaySayfaState extends State<KisiDetaySayfa> {


  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();


  Future<void> guncelle(int kisi_id,String kisi_ad, String kisi_tel) async
  {
    await KisilerDAO().kisiGuncelle(kisi_id, kisi_ad, kisi_tel);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }

  @override
  void initState() {
    super.initState();
    tfKisiAdi.text = widget.kisi.kisi_ad;
    tfKisiTel.text = widget.kisi.kisi_tel;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        title: Text("Kişi Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0,right: 50.0),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox( width: 200,height:200,child: Image.asset("assets/resimler/people.png")),
                TextField(
                  controller: tfKisiAdi,
                  decoration: InputDecoration(
                      labelText: "Kişi Adı"),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: tfKisiTel,
                  decoration: InputDecoration(
                      labelText: "Kişi Nuamrası"),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()
        {
          guncelle(widget.kisi.kisi_id, tfKisiAdi.text, tfKisiTel.text);

        },
        backgroundColor: Colors.deepOrange[300],
        tooltip: "Kişi Güncelle",
        icon: Icon(Icons.update),
        label: Text("Güncelle"),
      ),
    );
  }
}

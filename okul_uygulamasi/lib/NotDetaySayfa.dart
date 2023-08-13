import 'package:flutter/material.dart';
import 'package:okul_uygulamasi/Notlar.dart';
import 'package:okul_uygulamasi/NotlarDAO.dart';
import 'package:okul_uygulamasi/main.dart';

class NotDetaySayfa extends StatefulWidget {
  late Notlar not;
  NotDetaySayfa({ required this.not});


  @override
  State<NotDetaySayfa> createState() => _NotDetaySayfaState();
}

class _NotDetaySayfaState extends State<NotDetaySayfa> {

  var tfDersAdi = TextEditingController();
  var tfNot1 = TextEditingController();
  var tfNot2 = TextEditingController();


  Future<void> sil(int not_id) async
  {
    await NotlarDAO().notSil(not_id);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }


  Future<void> guncelle(int not_id,String ders_adi, int not1, int not2) async
  {
    await NotlarDAO().notGuncelle(not_id, ders_adi, not1, not2);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }

  @override
  void initState() {
    super.initState();
    var notBilgileri = widget.not;
    tfDersAdi.text = notBilgileri.ders_adi;
    tfNot1.text = notBilgileri.not1.toString();
    tfNot2.text = notBilgileri.not2.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Not Detayları"),
        actions: [
          TextButton(
            child: Text("SİL",style: TextStyle(color:Colors.white),),
            onPressed: ()
            {
              sil(widget.not.not_id);
            },
          ),
          TextButton(
            child: Text("GÜNCELLE",style: TextStyle(color:Colors.white),),
            onPressed: ()
            {
              guncelle(widget.not.not_id, tfDersAdi.text, int.parse(tfNot1.text),int.parse(tfNot2.text));
            },
          ),
        ],
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50.0, left: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Köşe yarıçapı
                        child: Image.asset(
                          "assets/resimler/trash.png",
                          width: 100, // Görüntünün genişliği
                          height: 175, // Görüntünün yüksekliği
                          fit: BoxFit.contain, // Görüntünün sığdırılma yöntemi (sıkıştır, kes, kapla, vs.)
                        ),
                      )
                  ),
                  SizedBox(
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Köşe yarıçapı
                        child: Image.asset(
                          "assets/resimler/refresh.png",
                          width: 100, // Görüntünün genişliği
                          height: 175, // Görüntünün yüksekliği
                          fit: BoxFit.contain, // Görüntünün sığdırılma yöntemi (sıkıştır, kes, kapla, vs.)
                        ),
                      )
                  ),
                ],
              ),
              TextField(
                enabled: false,
                controller: tfDersAdi,
                decoration: InputDecoration(
                  labelText: "Ders Adı",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: tfNot1,
                decoration: InputDecoration(
                    labelText: "1. Not",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: tfNot2,
                decoration: InputDecoration(
                  labelText: "2. Not",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/sonucEkrani.dart';

class tahminEkrani extends StatefulWidget {

  @override
  State<tahminEkrani> createState() => _tahminEkraniState();
}

class _tahminEkraniState extends State<tahminEkrani> {

  var tfTahmin = TextEditingController();
  late int rasgeleSayi = 0;
  late int kalanHak = 5;
  late String ipucu = "";

  @override
  void initState() {
    super.initState();

    rasgeleSayi = Random().nextInt(101); // 0 - 100 Arası Sayı üretir.
    print("Rasgele Sayımız: $rasgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tahim Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Kalan Hak: $kalanHak", style: TextStyle(color: Colors.lightBlue,fontSize: 30),),
            Text("İpucu: $ipucu", style: TextStyle(color: Colors.black54,fontSize: 20),),
            Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("TAHMİN ET", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent
                ),
                onPressed:(){
                  setState(() {
                    kalanHak = kalanHak - 1;

                  });

                  late int tahmin = int.parse(tfTahmin.text);

                  if(tahmin == rasgeleSayi)
                  {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sonucEkrani(sonuc: true,)));
                    return;
                  }
                  if(tahmin > rasgeleSayi)
                  {
                    setState(() {
                      ipucu = "Tahminini Azalt";
                    });
                  }
                  if(tahmin < rasgeleSayi)
                  {
                    setState(() {
                      ipucu = "Tahminini Arttır";
                    });
                  }
                  if(kalanHak == 0)
                  {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sonucEkrani(sonuc: false,)));
                    return;
                  }
                  tfTahmin.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

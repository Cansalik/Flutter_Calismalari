import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/Yemekler.dart';

class YemekDetay extends StatefulWidget {
  Yemekler yemek;


  YemekDetay({ required this.yemek});

  @override
  State<YemekDetay> createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("${widget.yemek.yemek_adi} Detayı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.yemek.yemek_resim_adi}"),
            Text("${widget.yemek.yemek_fiyat} \u{20BA}",style: TextStyle(fontSize: 48,color: Colors.blue),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange
                ),
                child: Text("SİPARİŞ VER",style: TextStyle(color: Colors.white),),
                onPressed: ()
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Siparişiniz Alındı.", style: TextStyle(color: Colors.white),),
                      backgroundColor: Colors.orange,
                      duration: Duration(seconds: 1),
                      ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}

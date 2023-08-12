import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';


class SonucEkrani extends StatefulWidget {

  late int dogruSayisi;
  late int yanlisSayisi;


  SonucEkrani({required this.dogruSayisi, required this.yanlisSayisi});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/resimler/quizBg.jpg"), // Arkaplan resmi
            fit: BoxFit.cover, // Resmi kaplayacak şekilde ayarla
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 150.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 75,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: GFButton(
                          child: Text("Doğru: ${widget.dogruSayisi}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'MyCustomFont'),),
                          shape: GFButtonShape.pills,
                          color: Colors.greenAccent,
                          onPressed: ()
                          {
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 250,
                  height: 75,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GFButton(
                      child: Text("Yanlış: ${widget.yanlisSayisi}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'MyCustomFont'),),
                      shape: GFButtonShape.pills,
                      color: Colors.redAccent,
                      onPressed: ()
                      {
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 75,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GFButton(
                      child: Text("Başarı Oranı: %${((widget.dogruSayisi * 100) /(widget.dogruSayisi + widget.yanlisSayisi))} ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'MyCustomFont'),),
                      shape: GFButtonShape.pills,
                      color: Colors.grey,
                      onPressed: ()
                      {
                      },
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: ()
                    {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: Image.asset("assets/resimler/try_again.png",width: 200,height: 200,),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

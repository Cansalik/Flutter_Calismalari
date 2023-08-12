import 'dart:collection';

import 'package:bayrak_quiz_uygulamasi/Bayraklar.dart';
import 'package:bayrak_quiz_uygulamasi/BayraklarDAO.dart';
import 'package:bayrak_quiz_uygulamasi/SonucEkrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {

  var sorular = <Bayraklar>[];
  var yanlisSecenekler = <Bayraklar>[];
  late Bayraklar dogruSoru;
  var tumSecenekler = HashSet<Bayraklar>();

  late int soruSayac = 0;
  late int dogruSayac = 0;
  late int yanlisSayac = 0;

  late String bayrakResimAdi = "placeholder.png";
  late String buttonAyazi = "";
  late String buttonByazi = "";
  late String buttonCyazi = "";
  late String buttonDyazi = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sorulariGetir();

  }


  Future<void> sorulariGetir() async
  {
    sorular = await BayraklarDAO().rasgeleDogruGetir();
    soruYukle();
  }

  Future<void> soruYukle() async
  {
    dogruSoru = sorular[soruSayac];
    bayrakResimAdi = dogruSoru.bayrak_resim;
    yanlisSecenekler = await BayraklarDAO().rasgeleYanlisGetir(dogruSoru.bayrak_id);
    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    buttonAyazi = tumSecenekler.elementAt(0).bayrak_ad;
    buttonByazi = tumSecenekler.elementAt(1).bayrak_ad;
    buttonCyazi = tumSecenekler.elementAt(2).bayrak_ad;
    buttonDyazi = tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {
    });
  }


  void soruSayacKontrol()
  {
    soruSayac = soruSayac + 1;

    if(soruSayac!=10)
    {
      soruYukle();
    }
    else
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(dogruSayisi: dogruSayac,yanlisSayisi: yanlisSayac,)));
    }
  }


  void dogruKontrol(String buttonYazi)
  {
    if(dogruSoru.bayrak_ad == buttonYazi)
    {
      dogruSayac = dogruSayac + 1;
    }
    else
    {
      yanlisSayac = yanlisSayac + 1;
    }
  }

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
        child: SizedBox(
          child: Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:  EdgeInsets.only(bottom: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Doğru: $dogruSayac",style: TextStyle(fontSize: 25,color: Colors.green,fontFamily: 'MyCustomFont',fontWeight: FontWeight.bold),),
                        Text("Yanlış: $yanlisSayac",style: TextStyle(fontSize: 25,color: Colors.red,fontFamily: 'MyCustomFont',fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 275,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Köşe yarıçapı
                        child: Image.asset(
                          "assets/resimler/$bayrakResimAdi",
                          width: 100, // Görüntünün genişliği
                          height: 175, // Görüntünün yüksekliği
                          fit: BoxFit.cover, // Görüntünün sığdırılma yöntemi (sıkıştır, kes, kapla, vs.)
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0,top: 35.0,left: 8.0,right: 8.0),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amberAccent,
                            onPrimary: Colors.black,
                        ),
                        child: Text("$buttonAyazi"),
                        onPressed: ()
                        {
                          dogruKontrol(buttonAyazi);
                          soruSayacKontrol();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amberAccent,
                            onPrimary: Colors.black
                        ),
                        child: Text("$buttonByazi"),
                        onPressed: ()
                        {
                          dogruKontrol(buttonByazi);
                          soruSayacKontrol();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amberAccent,
                            onPrimary: Colors.black
                        ),
                        child: Text("$buttonCyazi"),
                        onPressed: ()
                        {
                          dogruKontrol(buttonCyazi);
                          soruSayacKontrol();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amberAccent,
                            onPrimary: Colors.black
                        ),
                        child: Text("$buttonDyazi"),
                        onPressed: ()
                        {
                          dogruKontrol(buttonDyazi);
                          soruSayacKontrol();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

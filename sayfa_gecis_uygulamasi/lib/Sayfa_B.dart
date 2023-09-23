import 'package:flutter/material.dart';
import 'package:sayfa_gecis_uygulamasi/main.dart';

class Sayfa_B extends StatefulWidget {
  const Sayfa_B({Key? key}) : super(key: key);

  @override
  State<Sayfa_B> createState() => _Sayfa_BState();
}

class _Sayfa_BState extends State<Sayfa_B> {

  Future<bool> geriDonusTusu(BuildContext) async
  {
    print("Geri Tuşu Tıklandı");
    Navigator.of(context).popUntil((route) => route.isFirst);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sayfa B"),
        leading: IconButton(
         icon: Icon(Icons.arrow_back),
         onPressed: ()
         {
           print("AppBar geri tuşu tıklandı ve anasayfaya geri dönüldü.");
           Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
         },
        ),
      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text("Geldiğin Sayfaya Dön"),
                onPressed: ()
                {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text("Anasayfaya Geçiş Yap."),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
                },
              ),
              ElevatedButton(
                child: Text("Anasayfaya Dön."),
                onPressed: ()
                {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

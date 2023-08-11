import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SayfaA extends StatefulWidget {

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {

  Future<void> veriOku() async
  {
    var sp = await SharedPreferences.getInstance();

    late String ad = sp.getString("Ad") ?? "İsim Yok";
    late int yas = sp.getInt("Yas") ?? 99;
    late double boy = sp.getDouble("Boy") ?? 9.99;
    late bool bekarMi = sp.getBool("BekarMi") ?? false;

    var arkadasListe = sp.getStringList("arkadasListe") ?? null;


    print("Ad: $ad");
    print("Yaş: $yas");
    print("Boy: $boy");
    print("Bekar mı ? $bekarMi");

    for (var a in arkadasListe!)
    {
      print("Arkadaş: $a");
    }
    
  }


  Future<void> veriSil() async
  {
    var sp = await SharedPreferences.getInstance();

    sp.remove("Ad");
  }

  Future<void> veriGuncelle() async
  {
    var sp = await SharedPreferences.getInstance();

    sp.setInt("Yas",10);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //veriSil();
    veriGuncelle();
    veriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("SayfaA"),
      ),
      body: Center(

      ),
    );
  }
}

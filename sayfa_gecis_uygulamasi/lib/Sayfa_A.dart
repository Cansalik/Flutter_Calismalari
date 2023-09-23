import 'package:flutter/material.dart';
import 'package:sayfa_gecis_uygulamasi/Kisiler.dart';
import 'package:sayfa_gecis_uygulamasi/Sayfa_B.dart';


class Sayfa_A extends StatefulWidget {

  Kisiler kisi;

  Sayfa_A({required this.kisi});

  @override
  State<Sayfa_A> createState() => _Sayfa_AState();
}

class _Sayfa_AState extends State<Sayfa_A> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sayfa A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Sayfa B'ye Git."),
              onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Sayfa_B()));
              },
            ),
            Text("İsim: ${widget.kisi.isim}"),
            Text("Yaş: ${widget.kisi.yas}"),
            Text("Boy: ${widget.kisi.boy}"),
            Text("Bekar mı ?: ${widget.kisi.bekarMi}"),
          ],
        ),
      ),
    );
  }
}

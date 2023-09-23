import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_kullanimi/sayacModel.dart';

class ikinciSayfa extends StatelessWidget {


  var sayacNesne = sayacModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("İkinci Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder:(_)
              {
                return Text("${sayacNesne.sayac}", style: TextStyle(fontSize: 36),);
              }
            ),
            ElevatedButton(
              child: Text("Sayaç Arttır"),
              onPressed: ()
              {
                sayacNesne.sayaciArttir(5);
              },
            ),
            ElevatedButton(
              child: Text("Sayaç Azalt"),
              onPressed: ()
              {
                sayacNesne.sayaciAzalt(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

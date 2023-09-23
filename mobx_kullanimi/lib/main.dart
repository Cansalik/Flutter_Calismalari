import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_kullanimi/ikinciSayfa.dart';
import 'package:mobx_kullanimi/sayacModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Anasayfa(),
    );
  }
}


class Anasayfa extends StatelessWidget {

  var sayacNesne = sayacModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Anasayfa"),
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
              child: Text("Geçiş Yap"),
              onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ikinciSayfa()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

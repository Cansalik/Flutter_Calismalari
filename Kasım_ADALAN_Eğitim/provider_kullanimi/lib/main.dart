import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_kullanimi/ikinciSayfa.dart';
import 'package:provider_kullanimi/sayacModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => sayacModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Anasayfa(),
      ),
    );
  }
}


class Anasayfa extends StatelessWidget {

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
            Consumer<sayacModel>(
                builder: (context, sayacModelNesne,child)
                {
                  return Text("${sayacModelNesne.sayacOku()}",style: TextStyle(fontSize: 30),);
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

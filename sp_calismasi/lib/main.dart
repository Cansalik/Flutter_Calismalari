import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_calismasi/SyafaA.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future<void> veriKaydi() async
  {
    var sp = await SharedPreferences.getInstance();

    sp.setString("Ad", "Neşet Can");
    sp.setInt("Yas", 22);
    sp.setDouble("Boy", 1.76);
    sp.setBool("BekarMi", true);

    var arkadasListe = <String>[];
    arkadasListe.add("Ece");
    arkadasListe.add("Ali");
    
    sp.setStringList("arkadasListe", arkadasListe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Shared Preferance Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Geçiş Yap"),
              onPressed: ()
              {
                veriKaydi();
                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

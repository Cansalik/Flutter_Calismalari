import 'package:bayrak_quiz_uygulamasi/QuizEkrani.dart';
import 'package:flutter/material.dart';

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

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/resimler/mainBg.jpg"), // Arkaplan resmi
            fit: BoxFit.cover, // Resmi kaplayacak şekilde ayarla
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("HOŞ GELDİNİZ",style:TextStyle(fontSize: 44,fontFamily: 'MyCustomFont',fontWeight: FontWeight.bold),),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    onPrimary: Colors.black
                  ),
                  child: Text("QUİZE BAŞLA"),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizEkrani()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

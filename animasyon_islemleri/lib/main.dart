import 'dart:math';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  late AnimationController animasyonKontrol;

  late Animation<double> scaleAnimasyonDegerleri;
  late Animation<double> alphaAnimasyonDegerleri;
  late Animation<double> rotateAnimasyonDegerleri;
  late Animation<double> translateAnimasyonDegerleri;

  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 3000),vsync: this);
    translateAnimasyonDegerleri = Tween(begin: -20.0, end: 0.0).animate(animasyonKontrol)..addListener((){setState(() {});});
  }

  @override
  void dispose() {
    super.dispose();
    animasyonKontrol.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.wb_cloudy,color: Colors.white,size: 128,),
            Transform.translate(
              offset: Offset(translateAnimasyonDegerleri.value,0.0),
                child: Text("Hava Durumu",style: TextStyle(color: Colors.white,fontSize: 26),),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("BAŞLA",style: TextStyle(color: Colors.white,fontSize: 18),),
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: (){
                  animasyonKontrol.repeat(reverse: true);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

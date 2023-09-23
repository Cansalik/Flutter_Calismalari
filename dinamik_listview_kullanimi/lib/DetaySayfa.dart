import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {

  late String ulkeAdi;


  DetaySayfa({ required this.ulkeAdi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Detay Sayfası"),
      ),
      body: Center(
        child: Text("Merhaba ${widget.ulkeAdi}",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}

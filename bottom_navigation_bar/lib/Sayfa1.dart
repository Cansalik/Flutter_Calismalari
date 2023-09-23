import 'package:flutter/material.dart';

class SayfaBir extends StatefulWidget {

  @override
  State<SayfaBir> createState() => _SayfaBirState();
}

class _SayfaBirState extends State<SayfaBir> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Sayfa Bir", style: TextStyle(color: Colors.black54, fontSize: 30),),
    );
  }
}

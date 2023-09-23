import 'package:flutter/material.dart';

class SayfaA extends StatefulWidget {

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {

  @override
  void deactivate() {
    super.deactivate();
    print("Sayfa A: deactivate() çalıştı.");
  }

  @override
  void dispose() {
    super.dispose();
    print("Sayfa A: dispose() çalıştı.");
  }


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

          ],
        ),
      ),
    );
  }
}

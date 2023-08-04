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

  late bool aramaYapiliyorMu = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: aramaYapiliyorMu ?
            TextField(
              decoration: InputDecoration(hintText: "Ara..",),
              onChanged: (aramaSonucu)
              {
                print("Arama Sonucu: $aramaSonucu");
              },
            )
            : Text("AppBar Arama"),
        actions: [
          aramaYapiliyorMu ? IconButton(
            icon: Icon(Icons.cancel),
            onPressed: ()
            {
              setState(() {
                aramaYapiliyorMu = false;
              });
            },
          ) :
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()
            {
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          ),
        ],
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

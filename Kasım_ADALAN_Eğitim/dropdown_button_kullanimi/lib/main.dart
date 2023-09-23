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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var ulkelerListe = <String>[];

  String secilenUlke = "Turkiye";

  @override
  void initState() {
    super.initState();
    ulkelerListe.add("Turkiye");
    ulkelerListe.add("ABD");
    ulkelerListe.add("İtalya");
    ulkelerListe.add("Almanya");
    ulkelerListe.add("Rusya");
    ulkelerListe.add("Çin");
    ulkelerListe.add("Fransa");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            DropdownButton<String>(
              value: secilenUlke,
              items: ulkelerListe.map<DropdownMenuItem<String>>((String value)
              {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text("$value",style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20
                  ),),
                );
              }).toList(),
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (String? secilenVeri)
              {
                setState(() {
                  secilenUlke = secilenVeri!;
                });
              },
            ),
            Text("Seçilen ülke: $secilenUlke"),
            ElevatedButton(
              child: Text("Göster"),
              onPressed: ()
              {
                print("En Son Seçilen Ülke: $secilenUlke");
              },
            ),
          ],
        ),
      ),
    );
  }
}

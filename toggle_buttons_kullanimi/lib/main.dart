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

  List<bool> toggleDurumlar = [false, true, false];
  late int secilenToggleIndeks = 0;

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
            ToggleButtons(
              children: [
                Icon(Icons.looks_one),
                Icon(Icons.looks_two),
                Icon(Icons.looks_3),
              ],
              isSelected: toggleDurumlar,
              color: Colors.pink,
              selectedColor: Colors.yellow,
              fillColor: Colors.green,
              onPressed: (int secilenIndeks)
              {
                secilenToggleIndeks = secilenIndeks;
                print("${secilenIndeks + 1}, toggle seçildi.");

                setState(() {
                  toggleDurumlar[secilenIndeks] = !toggleDurumlar[secilenIndeks];
                });
              }
            ),
            ElevatedButton(
              child: Text("Gsöter"),
              onPressed:()
              {
                print("En Son ${secilenToggleIndeks + 1}. Toggle Seçildi. ");
              },
            ),
          ],
        ),
      ),
    );
  }
}

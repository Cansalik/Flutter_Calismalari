import 'package:bottom_navigation_bar/Sayfa1.dart';
import 'package:bottom_navigation_bar/Sayfa2.dart';
import 'package:bottom_navigation_bar/Sayfa3.dart';
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

class _MyHomePageState extends State<MyHomePage> {

  var sayfaListesi = [SayfaBir(), SayfaIki(), SayfaUc()];
  late int secilenIndeks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Navigation Bar Kullanımı"),
      ),
      body: sayfaListesi[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: "Bir",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: "İki",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: "Üç",
          ),
        ],
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        currentIndex: secilenIndeks,
        onTap: (indeks)
        {
          setState(() {
            secilenIndeks = indeks;
          });
        },
      ),
    );
  }
}

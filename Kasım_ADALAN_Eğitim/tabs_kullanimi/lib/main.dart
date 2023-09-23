import 'package:flutter/material.dart';
import 'package:tabs_kullanimi/Sayfa1.dart';
import 'package:tabs_kullanimi/Sayfa2.dart';
import 'package:tabs_kullanimi/Sayfa3.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("Tabs Kullanımı"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.add),text: "Ekle",),
              Tab(icon: Icon(Icons.remove),text: "Sil",),
              Tab(icon: Icon(Icons.update),text: "Güncelle",),
            ],
            indicatorColor: Colors.white,
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Sayfa1(),
            Sayfa2(),
            Sayfa3(),
          ],
        ),
      ),
    );
  }
}

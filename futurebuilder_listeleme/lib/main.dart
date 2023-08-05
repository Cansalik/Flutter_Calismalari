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

class _MyHomePageState extends State<MyHomePage> {

  Future<List<String>> Sehirler() async
  {
    var liste = ["Türkiye", "Almanya", "Japonya", "Rusya", "Çin"];
    return liste;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Future Builder Kullanımı"),
      ),
      body: FutureBuilder<List<String>>(
        future: Sehirler(),
        builder: (context, snapshot)
        {
          if(snapshot.hasData)
          {
            var liste = snapshot.data;
            return ListView.builder(
              itemCount: liste!.length,
              itemBuilder: (context, indeks)
              {
                var R = Random().nextInt(999);
                var G = Random().nextInt(999);
                var B = Random().nextInt(999);

                return Card(
                  color: Color.fromRGBO(R, G, B,1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text(liste[indeks]),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else
          {
            return Center();
          }
        },
      ),
    );
  }
}

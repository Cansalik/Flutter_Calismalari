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
      home: const MyHomePage(title: 'SizedBox - Spacer - Padding Kullanımı.'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 40, top: 20, bottom: 30),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
        ],
      ),

      /*Column(
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.red,
          ),
          Spacer(
            flex: 30,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          ),
          Spacer(
            flex: 70,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
        ],
      ),*/

      /*Row(
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.red,
          ),
          SizedBox(
            width: 100,
            height: 100,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
        ],
      ),*/

      /*Row(
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.red,
          ),
          SizedBox(
            width: 200,
            height: 400,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
        ],
      ),*/
    );
  }
}

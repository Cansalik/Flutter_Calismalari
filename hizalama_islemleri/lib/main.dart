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
      home: const MyHomePage(title: 'Hizalama'),
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.red,
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
      ),

      /*Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.red,
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

      /*Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.red,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.red,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.red,
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

      /*Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.red,
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
    );
  }
}

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
  
  var tfController = TextEditingController();
  late String alinanVeri = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Text - Button - TextField"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: tfController,
                obscureText: true,
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                maxLength: 4,
                decoration: InputDecoration(
                    hintText: "İçerik Giriniz",
                    hintStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                  labelText: "E-Mail:",
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  prefixIcon: Icon(Icons.print),
                ),
              ),
            ),
            ElevatedButton(
              child: Text("Veriyi Al"),
              onPressed: ()
              {
                setState(() {
                  alinanVeri = tfController.text;
                });
              },
            ),
            Text("Gelen Veri: ${alinanVeri}",
              style: TextStyle(
                color: Colors.yellow,
                backgroundColor: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

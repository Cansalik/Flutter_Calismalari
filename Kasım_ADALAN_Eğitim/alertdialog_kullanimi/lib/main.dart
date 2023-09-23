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


  var tfControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Alert Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Basit Alert"),
              onPressed: ()
              {
                showDialog(
                  context: context,
                  builder: (BuildContext contex)
                  {
                    return AlertDialog(
                      title: Text("Başlık"),
                      content: Text("İçerik"),
                      actions: [
                        TextButton(
                          child: Text("İptal"),
                          onPressed: ()
                          {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text("Tamam"),
                          onPressed: ()
                          {
                            print("Tamam Seçildi");
                          },
                        ),
                      ],
                    );
                  }
                );
              },
            ),
            ElevatedButton(
              child: Text("Özel Alert"),
              onPressed: ()
              {
                showDialog(
                    context: context,
                    builder: (BuildContext contex)
                    {
                      return AlertDialog(
                        title: Text("Özel Alert", style: TextStyle(color: Colors.white),),
                        backgroundColor: Colors.amberAccent,
                        content: SizedBox(
                          height: 80,
                          child: Column(
                            children:  <Widget>[
                              TextField(
                                controller: tfControl,
                                decoration: InputDecoration(
                                  labelText: "Veri",
                                ),
                              )
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: Text("İptal"),
                            onPressed: ()
                            {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text("Veri Oku"),
                            onPressed: ()
                            {
                              late String alinanVeri = tfControl.text;
                              print("Veri Okundu: $alinanVeri");
                              tfControl.text = "";
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

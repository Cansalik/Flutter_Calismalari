import 'package:flutter/material.dart';
import 'package:yasam_dongusu_calismasi/SayfaA.dart';

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
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    print("initState() metodu çalıştı.");
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state)
  {
    if(state == AppLifecycleState.inactive)
    {
      print("inactive() çalıştı.");
    }
    if(state == AppLifecycleState.paused)
    {
      print("paused() çalıştı.");
    }
    if(state == AppLifecycleState.resumed)
    {
      print("resumed() çalıştı.");
    }
    if(state == AppLifecycleState.detached)
    {
      print("detached() çalıştı.");
    }
  }




  @override
  Widget build(BuildContext context) {
    print("build() metodu çalıştı.");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: Text("Tıkla"),
              onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA()));
              },
            )
          ],
        ),
      ),
    );
  }
}

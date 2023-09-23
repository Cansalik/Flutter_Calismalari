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

  var tfTarih = TextEditingController();
  var tfSaat = TextEditingController();
  
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
            
            TextField(
              controller: tfTarih,
              decoration: InputDecoration(
                hintText: "Tarih Girinz",
              ),
              onTap: ()
              {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                ).then((alinanTarih)
                {
                  setState(() {
                    tfTarih.text = "${alinanTarih!.day}/${alinanTarih.month}/${alinanTarih.year}";
                  });
                });
              },
            ),
            TextField(
              controller: tfSaat,
              decoration: InputDecoration(
                hintText: "Saat Girinz",
              ),
              onTap: ()
              {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                ).then((alinanSaat)
                {
                  setState(() {
                    tfSaat.text = "${alinanSaat!.hour}:${alinanSaat!.minute}";
                  });
                });
              },
            ),
            
          ],
        ),
      ),
    );
  }
}

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Yemek Tarifi'),
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

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYukeskligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  width: ekranGenisligi,
                  child: Image.asset("resimler/yemekresim.jpeg"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: ekranGenisligi/8,
                        child: TextButton(
                          child: Yazi("Beğen", ekranGenisligi/25),
                          onPressed: (){
                            print("Beğenildi..");
                          },
                          style: ElevatedButton.styleFrom(

                            primary: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: ekranGenisligi/8,
                        child: TextButton(
                          child: Yazi("Yorum Yap", ekranGenisligi/25),
                          onPressed: (){
                            print("Yorum Yapıldı..");
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYukeskligi/100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Köfte",
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: ekranGenisligi/20,
                    ),
                    ),
                    Row(
                      children: [
                        Yazi("Izagara Üzerinde Pişirime Uygun", ekranGenisligi/25),
                        Spacer(),
                        Yazi("8 Ağustos", ekranGenisligi/25),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYukeskligi/100),
                child: Yazi("Uygun bir yoğurma kabı içerisine kıymamızı alalım. Üzerine rendelenmiş ve suyu sıkılmış soğan, küçük küçük kesilmiş sarımsak, yumurta, galeta unu, sıvı yağ, maydanoz, tuz, karabiber ve kimyonu alalım ve malzemelerimiz güzelce karışana kadar yoğuralım."
                 "Hazırladığımız harcımızın üzerini streç ile örtelim ve 30 dakika kadar buzdolabında dinlendirelim."
                 "Sürenin sonunda harcımızı dolaptan alalım, elimizle parçalar kopartarak  şekillendirelim.", ekranGenisligi/25),
              ),
            ],
          ),
        ),
    );
  }
}


class Yazi extends StatelessWidget {

  late String icerik;
  late double yaziBoyut;

  Yazi(this.icerik, this.yaziBoyut);

  @override
  Widget build(BuildContext context) {
    return Text(icerik,style: TextStyle(fontSize: yaziBoyut),);
  }
}


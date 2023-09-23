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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Başlık",style: TextStyle(color: Colors.white, fontSize: 16.0),),
            Text("Alt Başlık",style: TextStyle(color: Colors.white, fontSize: 12.0),),
          ],
        ),
        leading: IconButton(
          color: Colors.white,
          tooltip: "Menü İkon",
          icon: Icon(Icons.dehaze),
          onPressed: ()
          {
            print("Menü İkon Tıklandı.");
          },
        ),
        actions: [
          TextButton(
            child: Text("ÇIKIŞ", style: TextStyle(color: Colors.white),),
            onPressed: ()
            {
              print("Çıkış Tıklandı");
            },
          ),
          IconButton(
            color: Colors.white,
            tooltip: "Bilgi",
            icon: Icon(Icons.info_outline),
            onPressed: ()
            {
              print("İnfo Tıklandı.");
            },
          ),
          PopupMenuButton(
            color: Colors.white,
            child: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Sil"),

              ),
              PopupMenuItem(
                value: 2,
                child: Text("Güncelle"),
              ),
            ],
            onSelected: (menuItemValue)
            {
              if(menuItemValue == 1)
              {
                print("Sil Tıklandı");
              }
              if(menuItemValue == 2)
              {
                print("Güncelle Tıklandı");
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}

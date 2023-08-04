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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("SnackBar Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(
              child: Text("Varsayılan"),
              onPressed: ()
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Merhaba"),),
                );
              },
            ),

            ElevatedButton(
              child: Text("Snacbar Action"),
              onPressed: ()
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Silmek İsityor musunuz ? "),
                    action: SnackBarAction(
                      label: "Evet",
                      onPressed: ()
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Silindi"),),
                        );
                      },
                    ),
                  ),
                );
              },
            ),

            ElevatedButton(
              child: Text("Snackbar Özel"),
              onPressed: ()
              {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("İnternet Bağlantısı Yok !", style: TextStyle(color: Colors.blue),),
                    backgroundColor: Colors.white,
                    duration: Duration(seconds: 1),
                    action: SnackBarAction(
                      label: "Tekrar Dene",
                      textColor: Colors.red,
                      onPressed: ()
                      {
                        print("Tekrar Denendi.");
                      },
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

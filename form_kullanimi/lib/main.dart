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

  var formKey = GlobalKey<FormState>();
  var tfKullaniciAdi = TextEditingController();
  var tfKullaniciSifre = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("Form Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: tfKullaniciAdi,
                      decoration: InputDecoration(hintText: "Kullanıcı Adı",),
                      validator: (tfKAdi)
                      {
                        if(tfKAdi!.isEmpty)
                        {
                          return "Kullanıcı Adı Giriniz";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: tfKullaniciSifre,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Şifre",),
                      validator: (tfSifre)
                      {
                        if(tfSifre!.isEmpty)
                        {
                          return "Şifre Giriniz";
                        }
                        if(tfSifre.length < 6)
                        {
                          return "Şifre En Az 6 Haneli Olmalı";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        child: Text("Giriş Yap"),
                        onPressed: ()
                        {
                          bool kontrolSonuc = formKey.currentState!.validate();
                          if(kontrolSonuc)
                          {
                            late String KAdi = tfKullaniciAdi.text;
                            late String Sifre = tfKullaniciSifre.text;

                            print("Kullanıcı Adı: $KAdi ve Şifre: $Sifre");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

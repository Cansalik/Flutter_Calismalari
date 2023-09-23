import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_login_uygulamasi/main.dart';

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  late String spUserName;
  late String spPassword;

  Future<void> logState() async
  {
    var sp = await SharedPreferences.getInstance();

    setState(() {
      spUserName = sp.getString("userName") ?? "Kullanıcı Adı Yok";
      spPassword = sp.getString("password") ?? "Şifre Yok";
    });
  }


  Future<void> logOut() async
  {
    var sp = await SharedPreferences.getInstance();

    sp.remove("userName");
    sp.remove("password");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginEkrani()));
  }

  @override
  void initState() {
    super.initState();
    logState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Anasayfa"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: ()
            {
              logOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Kullanıcı Adı: $spUserName",style: TextStyle(fontSize: 30),),
              Text("Şifre: $spPassword",style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
      ),
    );
  }
}

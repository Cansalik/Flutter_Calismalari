import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_login_uygulamasi/Anasayfa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<bool> logState() async
  {
    var sp = await SharedPreferences.getInstance();

     String spUserName = sp.getString("userName") ?? "Kullanıcı Adı yok";
     String spPassword = sp.getString("password") ?? "şifre Adı yok";

    if(spUserName == "admin" && spPassword == "123456")
    {
      return true;
    }
    else
    {
      return false;
    }

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: logState(),
        builder: (context, snapshot)
        {
          if(snapshot.hasData)
          {
           bool? passPermit = snapshot.data;
           return passPermit! ? Anasayfa() : LoginEkrani();
          }
          else
          {
            return Container();
          }
        },
      ),
    );
  }
}

class LoginEkrani extends StatefulWidget {

  @override
  State<LoginEkrani> createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {

  var tfUserName = TextEditingController();
  var tfPassword = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> loginCheck() async
  {
    var uN = tfUserName.text;
    var pwd = tfPassword.text;

    if(uN == "admin" && pwd == "123456")
    {
      var sp = await SharedPreferences.getInstance();

      sp.setString("userName", uN);
      sp.setString("password", pwd);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Anasayfa()));
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Giriş Hatalı'),));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Giriş Yap"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: tfUserName,
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adı"
                ),
              ),
              TextField(
                obscureText: true,
                controller: tfPassword,
                decoration: InputDecoration(
                    hintText: "Şifre"
                ),
              ),
              ElevatedButton(
                child: Text("Giriş Yap"),
                onPressed: ()
                {
                  loginCheck();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

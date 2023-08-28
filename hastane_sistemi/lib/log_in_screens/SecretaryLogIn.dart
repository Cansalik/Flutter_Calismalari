import 'package:flutter/material.dart';
import 'package:hastane_sistemi/reusable_widgets/reusable_widget.dart';
import 'package:hastane_sistemi/secretary_screens/secretaryPswdReset.dart';
import 'package:hastane_sistemi/secretary_screens/secretaryScreen.dart';

class SecretaryLogIn extends StatefulWidget {
  const SecretaryLogIn({Key? key}) : super(key: key);

  @override
  State<SecretaryLogIn> createState() => _SecretaryLogInState();
}

class _SecretaryLogInState extends State<SecretaryLogIn> {

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.brown.shade100,Colors.blue.shade300,Colors.blue],
                begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/nurse.png",color: Colors.white,width: 240,height: 240,),
                const SizedBox(
                  height: 30,
                ),
                reusableTextFieldWhite("Kullanıcı Adı",Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextFieldWhite("Şifre", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_userNameTextController.text == "Sekreter" && _passwordTextController.text == "123456")
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => secretaryScreen()));
                          _userNameTextController.text = "";
                          _passwordTextController.text = "";
                        }
                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Şifre veya Kullanıcı Adı Hatalı!", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                              backgroundColor: Colors.white,
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                      child: Text("Giriş Yap",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => secretaryPswdReset()));
                  },
                  child: Text("Şifremi Unuttum ?",style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

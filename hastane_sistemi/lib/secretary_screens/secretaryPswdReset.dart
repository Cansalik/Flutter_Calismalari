import 'package:flutter/material.dart';
import 'package:hastane_sistemi/reusable_widgets/reusable_widget.dart';

class secretaryPswdReset extends StatefulWidget {
  const secretaryPswdReset({Key? key}) : super(key: key);

  @override
  State<secretaryPswdReset> createState() => _secretaryPswdResetState();
}

class _secretaryPswdResetState extends State<secretaryPswdReset> {

  TextEditingController _userTcTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _userSurNameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

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
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/nurse.png",color: Colors.white,width: 240,height: 240,),
                const SizedBox(height: 30,),
                reusableTextFieldBlack("T.C. Kimlik Numarası",Icons.numbers, false, _userTcTextController),
                const SizedBox(height: 10,),
                reusableTextFieldBlack("Adı", Icons.abc, false, _userNameTextController),
                const SizedBox(height: 10,),
                reusableTextFieldBlack("Soyadı", Icons.abc, false, _userSurNameTextController),
                const SizedBox(height: 20,),
                Text("Mevcut Şifre: ${_passwordTextController.text}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Şifreniz Mevcut Şifre Kısmında Yazmaktadır.", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            backgroundColor: Colors.black,
                            duration: Duration(seconds: 1),
                          ),
                        );
                        //Navigator.pop(context);
                      },
                      child: Text("Şifreyi Getir", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

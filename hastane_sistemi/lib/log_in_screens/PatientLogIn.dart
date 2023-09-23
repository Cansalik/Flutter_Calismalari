import 'package:flutter/material.dart';
import 'package:hastane_sistemi/patient_screens/patientMain.dart';
import 'package:hastane_sistemi/patient_screens/patientPswdReset.dart';
import 'package:hastane_sistemi/patient_screens/patientRegister.dart';
import '../reusable_widgets/reusable_widget.dart';

class PatientLogIn extends StatefulWidget {
  const PatientLogIn({Key? key}) : super(key: key);

  @override
  State<PatientLogIn> createState() => _PatientLogInState();
}

class _PatientLogInState extends State<PatientLogIn> {

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
                colors: [Colors.yellow.shade100,Colors.yellow.shade300,Colors.yellow.shade400],
                begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/heartbeat.png"),
                const SizedBox(height: 30,),
                reusableTextFieldBlack("Kullanıcı Adı",Icons.person_outline, false, _userNameTextController),
                const SizedBox(height: 20,),
                reusableTextFieldBlack("Şifre", Icons.lock_outline, true, _passwordTextController),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_userNameTextController.text == "Hasta" && _passwordTextController.text == "123456")
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => patientMain()));
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
                Column(
                  children: [
                    TextButton(
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => patientPswdReset()));
                      },
                      child: Text("Şifremi Unuttum ?",style: TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 16),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: TextButton(
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => patientRegister()));
                        },
                        child: Text("Kayıt Ol",style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

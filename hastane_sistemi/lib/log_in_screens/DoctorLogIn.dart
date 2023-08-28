import 'package:flutter/material.dart';
import 'package:hastane_sistemi/doctor_screens/patientList.dart';
import 'package:hastane_sistemi/log_in_screens/Begin.dart';
import '../reusable_widgets/reusable_widget.dart';

class DoctorLogIn extends StatefulWidget {
  const DoctorLogIn({Key? key}) : super(key: key);

  @override
  State<DoctorLogIn> createState() => _DoctorLogInState();
}

class _DoctorLogInState extends State<DoctorLogIn> {
  
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [Colors.blue.shade100,Colors.blue.shade300,Colors.blue],
              begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/heart.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextFieldWhite("Kullanıcı Adı", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextFieldWhite("Şifre", Icons.lock_outline, true,
                    _userNameTextController),
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

                        if(_emailTextController.text == "Doktor" && _userNameTextController.text == "123456")
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> patientList()));
                          print("Doktor Giriş Başarılı");
                          _emailTextController.text = "";
                          _userNameTextController.text = "";
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
                        primary: Colors.transparent,
                        elevation: 0.1,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: ()
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Sekreter İle Görüşün", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        backgroundColor: Colors.white,
                        duration: Duration(seconds: 1),
                      ),
                    );
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

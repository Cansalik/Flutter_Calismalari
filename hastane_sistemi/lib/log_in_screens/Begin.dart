import 'package:flutter/material.dart';
import 'package:hastane_sistemi/log_in_screens/DoctorLogIn.dart';
import 'package:hastane_sistemi/log_in_screens/PatientLogIn.dart';
import 'package:hastane_sistemi/log_in_screens/SecretaryLogIn.dart';

class Begin extends StatefulWidget {
  const Begin({Key? key}) : super(key: key);

  @override
  State<Begin> createState() => _BeginState();
}

class _BeginState extends State<Begin> {
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
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/logo1.png",color: Colors.white,width: 240,height: 240,),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientLogIn()));
                    },
                    child: Text("Hasta Girişi İçin Tıklayın",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.01,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DoctorLogIn()));
                    },
                    child: Text("Doktor Girişi İçin Tıklayın",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.01,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecretaryLogIn()));
                    },
                    child: Text("Sekreter Girişi İçin Tıklayın",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.01,
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

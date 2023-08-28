import 'package:flutter/material.dart';
import 'package:hastane_sistemi/secretary_screens/activeAppointmentsPanel.dart';
import 'package:hastane_sistemi/secretary_screens/branchManagementPanel.dart';
import 'package:hastane_sistemi/secretary_screens/createDoctorAppointment.dart';
import 'package:hastane_sistemi/secretary_screens/doctorSetPanel.dart';

class secretaryScreen extends StatefulWidget {
  const secretaryScreen({Key? key}) : super(key: key);

  @override
  State<secretaryScreen> createState() => _secretaryScreenState();
}

class _secretaryScreenState extends State<secretaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pinkAccent.shade100,Colors.blue.shade300,Colors.blue],
                begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/nurse.png",color: Colors.black,width: 240,height: 240,),
                const SizedBox(height: 30,),
                Text("Hoşgeldiniz, Merve SALIK",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>createDoctorAppointment()));
                    },
                    child: Text("Doktor Randevu Alanı Açma",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.01,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> doctorSetPanel()));
                    },
                    child: Text("Doktor Yönetim Paneli",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.01,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => branchManagementPanel()));
                    },
                    child: Text("Branş Yönetim Paneli",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => activeAppointmentsPanel()));
                    },
                    child: Text("Aktif Randevular Paneli",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
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

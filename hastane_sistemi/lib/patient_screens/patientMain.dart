import 'package:flutter/material.dart';
import 'package:hastane_sistemi/classes/Patients.dart';
import 'package:hastane_sistemi/patient_screens/Appointment.dart';
import 'package:hastane_sistemi/patient_screens/patientAppointment.dart';

class patientMain extends StatefulWidget {

  @override
  State<patientMain> createState() => _patientMainState();
}

class _patientMainState extends State<patientMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.yellow.shade100,Colors.yellow.shade300,Colors.yellow],
                begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/heart.png",color: Colors.white,width: 240,height: 240,),
                Text('Hasta Adı', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                Text('Hasta T.C.', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> patientAppointment()));
                    },
                    child: Text("Randevu Oluşturmak İçin Tıklayın",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> appointment()));
                    },
                    child: Text("Aktif Randevularınız İçin Tıklayın",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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

import 'package:flutter/material.dart';
import 'package:hastane_sistemi/DAO/PatientDAO.dart';
import 'package:hastane_sistemi/classes/Active_appointment.dart';
import 'package:hastane_sistemi/doctor_screens/doctorSettings.dart';
import 'package:hastane_sistemi/doctor_screens/patientDetail.dart';

class patientList extends StatefulWidget {

  @override
  State<patientList> createState() => _patientListState();
}

class _patientListState extends State<patientList> {

  Future<List<Active_appointment>> _patientList() async
  {
   var _patients = await PatientDAO().patientList();
    return _patients;
  }

  late String gender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bugünkü Hastalar",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
        backgroundColor: Colors.transparent, // Set the background color to transparent
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blue.shade300, Colors.blue.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body:Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.blue.shade100,
                  Colors.blue.shade300,
                  Colors.blue
                ],
                begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: FutureBuilder<List<Active_appointment>>(
              future: _patientList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var pat = snapshot.data;
                  return ListView.builder(
                    itemCount: pat!.length,
                    itemBuilder: (context, index) {
                      var patient = pat[index];
                      gender = patient.Patient.Patient_Gender;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => patientDetail()));
                        },
                        child: Card(
                          color: index % 2 == 0
                              ? Colors.blue.shade200
                              : Colors.blue.shade100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset("assets/images/$gender.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${patient.Patient.Patient_Name} ${patient.Patient.Patient_Surname}",
                                        style: TextStyle(
                                            fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${patient.Appointment_Time}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.pink[400],
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Text("Hata"),
                      ],
                    ),
                  );
                }
              },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => doctorSettings()));
        },
        tooltip: "Ayarlar",
        backgroundColor: Colors.pink,
        child: Icon(Icons.settings,color: Colors.white,),
      ),
    );
  }
}

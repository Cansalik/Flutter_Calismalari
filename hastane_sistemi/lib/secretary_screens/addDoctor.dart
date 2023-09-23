import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widget.dart';

class addDoctor extends StatefulWidget {
  const addDoctor({Key? key}) : super(key: key);

  @override
  State<addDoctor> createState() => _addDoctorState();
}

class _addDoctorState extends State<addDoctor> {

  TextEditingController _doctorNameTextController = TextEditingController();
  TextEditingController _doctorSurNameTextController = TextEditingController();
  TextEditingController _doctorTCTextController = TextEditingController();
  TextEditingController _doctorPasswordTextController = TextEditingController();

  String selectedDoctorBranch = "Doktor Branşı"; // Başlangıçta seçilen branş
  final List<String> doctorBranches = [
    "Doktor Branşı",
    "Dahiliye",
    "Cerrahi",
    "Kardiyoloji",
    "Nöroloji",
    "Ortopedi"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pinkAccent.shade100,Colors.blue.shade300,Colors.blue.shade400],
                begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/doctorTeam.png",width: 150,height: 150,),
                const SizedBox(height: 30,),
                reusableTextFieldBlack("Doktor Adı",Icons.person_outline, false, _doctorNameTextController),
                const SizedBox(height: 20,),
                reusableTextFieldBlack("Doktor Soyadı", Icons.person_outline, false, _doctorSurNameTextController),
                const SizedBox(height: 20,),
                reusableTextFieldBlack("Doktor T.C.", Icons.numbers, false, _doctorTCTextController),
                const SizedBox(height: 20,),
                reusableTextFieldBlack("Doktor Şifre", Icons.lock_outline, false, _doctorPasswordTextController),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedDoctorBranch,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDoctorBranch = newValue!;
                          });
                        },
                        items: doctorBranches.map<DropdownMenuItem<String>>((String branch) {
                          return DropdownMenuItem<String>(
                            value: branch,
                            child: Row(
                              children: [
                                Icon(Icons.local_hospital),
                                SizedBox(width: 10),
                                Text(
                                  branch,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {


                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Doktor Sisteme Eklendi", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            backgroundColor: Colors.black,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Text("Doktor'u Sisteme Ekle",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
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

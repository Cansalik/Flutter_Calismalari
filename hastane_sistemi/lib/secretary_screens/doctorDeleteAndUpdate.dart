import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hastane_sistemi/reusable_widgets/reusable_widget.dart';

class doctorDeleteAndUpdate extends StatefulWidget {
  const doctorDeleteAndUpdate({Key? key}) : super(key: key);

  @override
  State<doctorDeleteAndUpdate> createState() => _doctorDeleteAndUpdateState();
}

class _doctorDeleteAndUpdateState extends State<doctorDeleteAndUpdate> {


  String selectedDoctorBranch = "Doktor Branşı"; // Başlangıçta seçilen branş
  final List<String> doctorBranches = [
    "Doktor Branşı",
    "Dahiliye",
    "Cerrahi",
    "Kardiyoloji",
    "Nöroloji",
    "Ortopedi"
  ];

  String _selectedDoctor = "-------------"; // Başlangıçta seçilen branş
  final List<String> _doctor = [
    "-------------",
    "Mehmet Cansever",
    "Ömer Yurdakul",
    "Musa Atsal",
    "Hasan Çakmak"
  ];

  TextEditingController _doktorTcTextController = TextEditingController();

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
                logoWidget("assets/images/doctorsetting.png"),
                const SizedBox(height: 30,),
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
                const SizedBox(height: 30,),
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
                        value: _selectedDoctor,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedDoctor = newValue!;
                          });
                        },
                        items: _doctor.map<DropdownMenuItem<String>>((String doctor) {
                          return DropdownMenuItem<String>(
                            value: doctor,
                            child: Row(
                              children: [
                                Icon(Icons.local_hospital),
                                SizedBox(width: 10),
                                Text(
                                  doctor,
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
                const SizedBox(height: 30,),
                reusableTextFieldBlackDoctorDeleteAndUpdate("12345678910",Icons.numbers, true, _doktorTcTextController),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 350,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {


                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Doktor Silindi", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            backgroundColor: Colors.pinkAccent.shade100,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Text("Doktor'u Sil", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black26,
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


/*const SizedBox(height: 30,),
                reusableTextFieldBlack("Doktor Adı",Icons.person_outline, false, _doctorNameTextController),
                const SizedBox(height: 20,),
                reusableTextFieldBlack("Doktor Soyadı", Icons.person_outline, true, _doctorSurNameTextController),
                const SizedBox(height: 20,),
                reusableTextFieldBlack("Doktor T.C.", Icons.numbers, true, _doctorTCTextController),
                const SizedBox(height: 20,),
                reusableTextFieldBlack("Doktor Şifre", Icons.lock_outline, true, _doctorPasswordTextController),
                const SizedBox(height: 20,),*/
import 'package:flutter/material.dart';
import 'package:hastane_sistemi/DAO/patientAppointmentDAO.dart';
import 'package:hastane_sistemi/classes/Active_appointment.dart';
import 'package:hastane_sistemi/classes/Branches.dart';
import 'package:hastane_sistemi/classes/Doctors.dart';
import 'package:hastane_sistemi/classes/Patients.dart';
import 'package:hastane_sistemi/classes/deneme.dart';

class patientAppointment extends StatefulWidget {


  @override
  State<patientAppointment> createState() => _patientAppointmentState();
}

class _patientAppointmentState extends State<patientAppointment> {


  late String _selectedTime = "";
  late String _selectedDate = "";
  late String _Doctor_Name = "";

  Future<List<deneme>> timeList(String Doctor_Name, String Date) async
  {
    var _times = await patientAppointmentDAO().timeListt(Doctor_Name, Date);
    return _times;
  }


  Future<List<Active_appointment>> dateList(String Doctor_Name) async
  {
    var _date = await patientAppointmentDAO().dateList(Doctor_Name);
    return _date;
  }

  TextEditingController _complaintController = TextEditingController();


  late String selectedDoctorBranch = "Poliklinik Seçiniz";
  Future<List<Branches>> branchList() async
  {
    var _branches = await patientAppointmentDAO().branchList();
    return _branches;
  }


  late String selectedDoctor = "Doktor Seçiniz";
  late int _brnch_ID = 1;
  Future<List<Doctors>> doctorList(int Baranch_ID) async
  {
    var _doctors = await patientAppointmentDAO().doctorList(Baranch_ID);
    return _doctors;
  }


  Future<void> appointmnetCreate(String Patient_TC,int Appointmnet_State,String Patient_Complaint,String Appointment_Branch, String Appointment_Doctor, String Appointmnet_Date, String Appointment_Time) async
  {
    var _create = await patientAppointmentDAO().appointmentUpdate(Patient_TC, Appointmnet_State, Patient_Complaint, Appointment_Branch, Appointment_Doctor, Appointmnet_Date, Appointment_Time);
    return _create;
  }


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
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset("assets/images/doctorAppointment.png",color: Colors.black,width: 240,height: 240,),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FutureBuilder<List<Branches>>(
                      future: branchList(),
                      builder: (context,snapshot)
                      {
                        if (snapshot.hasData)
                        {
                          var branches = snapshot.data;
                          return DropdownButton<String>(
                            value: selectedDoctorBranch,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedDoctorBranch = newValue!;
                              });
                            },
                            items: branches!.map<DropdownMenuItem<String>>((Branches branch) {
                              return DropdownMenuItem<String>(
                                value: branch.Branch_Name, // Varsayılan olarak bu alanı kullanabilirsiniz, gerektiğinde ayarlayabilirsiniz
                                child: Row(
                                  children: [
                                    Text(branch.Branch_Name, style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                onTap: ()
                                {
                                  setState(() {
                                    _brnch_ID = branch.Branch_ID;
                                  });
                                },
                              );
                            }).toList(),
                          );
                        }
                        else
                        {
                          return Center();
                        }
                      },
                    ),
                  ),
                ),
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
                    child: FutureBuilder<List<Doctors>>(
                      future: doctorList(_brnch_ID),
                      builder: (context,snapshot)
                      {
                        if (snapshot.hasData)
                        {
                          var doctors = snapshot.data;
                          return DropdownButton<String>(
                            disabledHint: Text("Doktor Seçin"),
                            hint: Text(selectedDoctor,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedDoctor = newValue!;
                              });
                            },
                            value: null,
                            items: doctors!.map<DropdownMenuItem<String>>((Doctors dr) {
                              return DropdownMenuItem<String>(
                                value: "${dr.Doctor_Name} ${dr.Doctor_Surname}", // Varsayılan olarak bu alanı kullanabilirsiniz, gerektiğinde ayarlayabilirsiniz
                                child: Row(
                                  children: [
                                    Text(
                                      "${dr.Doctor_Name} ${dr.Doctor_Surname}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                onTap: ()
                                {
                                  setState(() {
                                    _Doctor_Name = "${dr.Doctor_Name} ${dr.Doctor_Surname}";
                                  });
                                },
                              );
                            }).toList(),
                          );
                        }
                        else
                        {
                          return Center();
                        }
                      },
                    ),
                  ),
                ),
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
                    child: FutureBuilder<List<Active_appointment>>(
                      future: dateList(_Doctor_Name),
                      builder: (context,snapshot)
                      {
                        if (snapshot.hasData)
                        {
                          var times = snapshot.data;
                          return DropdownButton<String>(
                            disabledHint: Text("Tarih"),
                            hint: Text(_selectedDate,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedDate = newValue!;
                              });
                            },
                            value: null,
                            items: times!.map<DropdownMenuItem<String>>((Active_appointment Ap) {
                              return DropdownMenuItem<String>(
                                value: "${Ap.Appointment_Date}", // Varsayılan olarak bu alanı kullanabilirsiniz, gerektiğinde ayarlayabilirsiniz
                                child: Row(
                                  children: [
                                    Text(
                                      "${Ap.Appointment_Date}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                onTap: ()
                                {
                                  setState(() {
                                    _selectedDate = "${Ap.Appointment_Date}";
                                  });
                                },
                              );
                            }).toList(),
                          );
                        }
                        else
                        {
                          return Center();
                        }
                      },
                    ),
                  ),
                ),
                Text(_selectedDate),
                Text(_Doctor_Name),
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
                    child: FutureBuilder<List<deneme>>(
                      future: timeList(_Doctor_Name,_selectedDate),
                      builder: (context,snapshot)
                      {
                        if (snapshot.hasData)
                        {
                          var times = snapshot.data;
                          return DropdownButton<String>(
                            disabledHint: Text("Saat"),
                            hint: Text(_selectedTime,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedTime = newValue!;
                              });
                            },
                            value: null,
                            items: times!.map<DropdownMenuItem<String>>((deneme Ap) {
                              return DropdownMenuItem<String>(
                                value: "${Ap.Appointment_Time}", // Varsayılan olarak bu alanı kullanabilirsiniz, gerektiğinde ayarlayabilirsiniz
                                child: Row(
                                  children: [
                                    Text(
                                      "${Ap.Appointment_Time}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        }
                        else
                        {
                          return Center();
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _complaintController,
                  decoration: InputDecoration(
                    labelText: 'Şikayetinizi Yazın',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      print(selectedDoctorBranch);
                      print(selectedDoctor);
                      print(_selectedDate);
                      print(_selectedTime);
                      print(_complaintController.text);
                      print("15988952906");

                      appointmnetCreate("15988952906", 1, _complaintController.text, selectedDoctorBranch, selectedDoctor, _selectedDate, _selectedTime);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Randevu Oluşturuldu", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Text("Randevu Oluştur",style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.01,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

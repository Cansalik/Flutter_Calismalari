import 'package:flutter/material.dart';

class createDoctorAppointment extends StatefulWidget {
  const createDoctorAppointment({Key? key}) : super(key: key);

  @override
  State<createDoctorAppointment> createState() => _createDoctorAppointmentState();
}

class _createDoctorAppointmentState extends State<createDoctorAppointment> {


  String appointmentDate = "Açılacak Randevunun Tarihi"; // Başlangıçta seçilen branş
  final List<String> _appointmentDate = [
    "Açılacak Randevunun Tarihi",
    "11.10.2022",
    "23.11.2022",
    "16.01.2022",
    "24.12.2022"
  ]; // Doktor branşları

  String appointmentTime = "08.00"; // Başlangıçta seçilen branş
  final List<String> _time = [
    "08.00",
    "08.30",
    "09.00",
    "09.30",
    "10.00",
    "10.30",
  ];

  String appointmentBranch = "Randevu Açılacak Poliklinik"; // Başlangıçta seçilen branş
  final List<String> _branch = [
    "Randevu Açılacak Poliklinik",
    "Genel Cerrahi",
    "Dahiliye",
    "Kadın Hastalıkları ve Doğum",
    "Çocuk Sağlığı ve Hastalıkları",
    "Ortopedi",
  ];

  String _selectedDoctor = "Randevu Açılacak Doktor"; // Başlangıçta seçilen branş
  final List<String> _doctor = [
    "Randevu Açılacak Doktor",
    "Neşet Can SALIK",
    "Mehmet Cansever",
    "Ömer Yurdakul",
    "Musa Atsal",
    "Hasan Çakmak"
  ];

  TextEditingController _controller = TextEditingController();

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
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/nurse.png",color: Colors.black,width: 200,height: 200,),
                const SizedBox(height: 10,),
                Text("Hoşgeldin, Merve SALIK",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
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
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: appointmentDate,
                        onChanged: (String? newValue) {
                          setState(() {
                            appointmentDate = newValue!;
                          });
                        },
                        items: _appointmentDate.map<DropdownMenuItem<String>>((String branch) {
                          return DropdownMenuItem<String>(
                            value: branch,
                            child: Row(
                              children: [
                                Icon(Icons.date_range),
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
                        value: appointmentTime,
                        onChanged: (String? newValue) {
                          setState(() {
                            appointmentTime = newValue!;
                          });
                        },
                        items: _time.map<DropdownMenuItem<String>>((String doctor) {
                          return DropdownMenuItem<String>(
                            value: doctor,
                            child: Row(
                              children: [
                                Icon(Icons.access_time_outlined),
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
                        value: appointmentBranch,
                        onChanged: (String? newValue) {
                          setState(() {
                            appointmentBranch = newValue!;
                          });
                        },
                        items: _branch.map<DropdownMenuItem<String>>((String time) {
                          return DropdownMenuItem<String>(
                            value: time,
                            child: Row(
                              children: [
                                Icon(Icons.local_hospital),
                                SizedBox(width: 10),
                                Text(
                                  time,
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
                        items: _doctor.map<DropdownMenuItem<String>>((String time) {
                          return DropdownMenuItem<String>(
                            value: time,
                            child: Row(
                              children: [
                                Icon(Icons.person_outline),
                                SizedBox(width: 10),
                                Text(
                                  time,
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
                  child: ElevatedButton(
                    onPressed: ()
                    {


                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Randevu Alanı Açıldı.", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          backgroundColor: Colors.black,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Text("Randevu Alanı Aç",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
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

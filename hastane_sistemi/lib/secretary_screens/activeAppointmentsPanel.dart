import 'package:flutter/material.dart';
import 'package:hastane_sistemi/classes/Active_appointment.dart';

class activeAppointmentsPanel extends StatefulWidget {
  const activeAppointmentsPanel({Key? key}) : super(key: key);

  @override
  State<activeAppointmentsPanel> createState() => _activeAppointmentsPanelState();
}

class _activeAppointmentsPanelState extends State<activeAppointmentsPanel> {

  Future<List<Active_appointment>> appointmentList() async {
    final List<Active_appointment> appointment = [
      /*Active_appointment("Branch A", "Dr. Deniz", "10:00 AM","02.09.2022"),
      Active_appointment("Branch B", "Dr. Johnson", "2:30 PM","05.06.2023"),
      Active_appointment("Branch s", "Dr. Alex", "5:30 PM","23.11.2023"),
      Active_appointment("Branch A", "Dr. Deniz", "10:00 AM","02.09.2022"),
      Active_appointment("Branch B", "Dr. Johnson", "2:30 PM","05.06.2023"),
      Active_appointment("Branch s", "Dr. Alex", "5:30 PM","23.11.2023"),
      Active_appointment("Branch A", "Dr. Deniz", "10:00 AM","02.09.2022"),
      Active_appointment("Branch B", "Dr. Johnson", "2:30 PM","05.06.2023"),
      Active_appointment("Branch s", "Dr. Alex", "5:30 PM","23.11.2023"),
      Active_appointment("Branch A", "Dr. Deniz", "10:00 AM","02.09.2022"),
      Active_appointment("Branch B", "Dr. Johnson", "2:30 PM","05.06.2023"),
      Active_appointment("Branch s", "Dr. Alex", "5:30 PM","23.11.2023"),
      */
    ];
    return appointment;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bugünün Aktif Randevuları",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
          future: appointmentList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var appointments = snapshot.data;
              return ListView.builder(
                itemCount: appointments!.length,
                itemBuilder: (context, index) {
                  var _appointments = appointments[index];
                  return GestureDetector(
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => patientDetail()));
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
                              child: Image.asset("assets/images/doctorAppointment.png")
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Doktor Adı",
                                    style: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Branş  Tarih   Saat",
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
                                color: Colors.red[400],
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
    );
  }
}

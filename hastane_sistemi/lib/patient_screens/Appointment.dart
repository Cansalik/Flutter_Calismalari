import 'package:flutter/material.dart';
import 'package:hastane_sistemi/classes/Active_appointment.dart';

class appointment extends StatefulWidget {
  const appointment({Key? key}) : super(key: key);

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {


  Future<List<Active_appointment>> appointmentList() async {
    final List<Active_appointment> appointment = [
      //Active_appointment(Appointment_ID, Appointment_Date, Appointment_Time, Appointment_Branch, Appointment_Doctor, Appointment_State, Appointment_TC, Appointment_Complaint, Patient)

    ];
    return appointment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Randevularınız"),
        backgroundColor: Colors.transparent, // Set the background color to transparent
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.yellow.shade300, Colors.yellow.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.yellow.shade100,
                  Colors.yellow.shade300,
                  Colors.yellow
                ],
                begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: FutureBuilder<List<Active_appointment>>(
          future: appointmentList(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var Active_appointment = snapshot.data;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5,
                ),
                itemCount: Active_appointment!.length,
                itemBuilder: (context,indeks){
                  var appoinment = Active_appointment[indeks];
                  return GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film ,)));
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/doctorAppointment.png"),
                            ),
                            Text(
                              "Doktor: ",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Tarih: ",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Saat: ",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 100,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: ()
                                {
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => SecretaryLogIn()));
                                },
                                child: Text("İptal Et",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red.shade100,
                                  elevation: 0.01,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  );
                },
              );
            }else{
              return Center();
            }
          },
        ),
      ),
    );
  }
}
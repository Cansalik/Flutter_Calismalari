import 'package:flutter/material.dart';
import 'package:hastane_sistemi/reusable_widgets/reusable_widget.dart';

class patientDetail extends StatefulWidget {

  @override
  State<patientDetail> createState() => _patientDetailState();
}


class txt extends StatelessWidget {

  late String icerik;
  late double yaziBoyut;

  txt(this.icerik, this.yaziBoyut);

  @override
  Widget build(BuildContext context) {
    return Text(icerik,style: TextStyle(fontSize: yaziBoyut,color: Colors.black),);
  }
}

class _patientDetailState extends State<patientDetail> {

  TextEditingController _treatmentTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade300, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width:150,height:150,child: Image.asset("assets/images/Erkek.png")),
                Text(
                  'Hasta Adı: John Doe',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
                  'Randevu Saati: 14:30',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height/100),
                  child: txt("Uygun bir yoğurma kabı içerisine kıymamızı alalım. Üzerine rendelenmiş ve suyu sıkılmış soğan, "
                      "küçük küçük kesilmiş sarımsak, yumurta, galeta unu, sıvı yağ, maydanoz, tuz, karabiber ve kimyonu alalım "
                      "ve malzemelerimiz güzelce karışana kadar yoğuralım.", MediaQuery.of(context).size.height/50),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Uygulanacak Tedavi',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20.0, // Dikey boyutu büyütür
                        horizontal: 15.0, // Yatay boyutu büyütür
                      ),
                    ),
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                    },
                    child: Text("Tedavi Et",style: TextStyle(color: Colors.white),),
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

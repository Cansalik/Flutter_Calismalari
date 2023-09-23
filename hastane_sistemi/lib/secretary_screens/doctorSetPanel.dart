import 'package:flutter/material.dart';
import 'package:hastane_sistemi/secretary_screens/addDoctor.dart';
import 'package:hastane_sistemi/secretary_screens/doctorDeleteAndUpdate.dart';

class doctorSetPanel extends StatefulWidget {
  const doctorSetPanel({Key? key}) : super(key: key);

  @override
  State<doctorSetPanel> createState() => _doctorSetPanelState();
}

class _doctorSetPanelState extends State<doctorSetPanel> {
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
                Image.asset("assets/images/doctorsetting.png",color: Colors.black,width: 240,height: 240,),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>addDoctor()));
                    },
                    child: Text("Doktor Ekle",style: TextStyle(color: Colors.white),),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> doctorDeleteAndUpdate()));
                    },
                    child: Text("Doktor Güncelle - Sil",style: TextStyle(color: Colors.white),),
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

import 'package:flutter/material.dart';

class doctorSettings extends StatefulWidget {
  const doctorSettings({Key? key}) : super(key: key);

  @override
  State<doctorSettings> createState() => _doctorSettingsState();
}

class _doctorSettingsState extends State<doctorSettings> {

  late bool _pwdVisible = true;


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
              children: [
                SizedBox(width:150,height:150,child: Image.asset("assets/images/Erkek.png")),
                Text(
                  'Ad: Neşet Can SALIK',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                Text(
                  'T.C.: 12311077046',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                Text(
                  'Göz Hastalıkları',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: _pwdVisible,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
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
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _pwdVisible,
                        onChanged: (bool? value) {
                          setState(() {
                            _pwdVisible = value!;
                          });
                        },
                      ),
                      Text('Şifreyi Gizle', style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: ()
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Bilgiler Güncellendi", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Text("Güncelle",style: TextStyle(color: Colors.white),),
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

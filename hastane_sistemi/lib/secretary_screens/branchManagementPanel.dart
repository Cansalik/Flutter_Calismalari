import 'package:flutter/material.dart';
import 'package:hastane_sistemi/DAO/patientAppointmentDAO.dart';
import 'package:hastane_sistemi/classes/Branches.dart';

class branchManagementPanel extends StatefulWidget {
  const branchManagementPanel({Key? key}) : super(key: key);

  @override
  State<branchManagementPanel> createState() => _branchManagementPanelState();
}

class _branchManagementPanelState extends State<branchManagementPanel> {

  Future<List<Branches>> branchList() async
  {
    var _branch = await patientAppointmentDAO().branchList();
    return _branch;
  }

  TextEditingController _branchNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Poliklinik Branşları",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
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
        child: FutureBuilder<List<Branches>>(
          future: branchList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var branchs = snapshot.data;
              return ListView.builder(
                itemCount: branchs!.length,
                itemBuilder: (context, index) {
                  var _branches = branchs[index];
                  return GestureDetector(
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => patientDetail()));
                    },
                    child: Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.local_hospital),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${_branches.Branch_Name} ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.redAccent.shade100,
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
          showDialog(
              context: context,
              builder: (BuildContext contex)
              {
                return Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade100,
                            Colors.blue.shade300,
                            Colors.blue
                          ],
                          begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: AlertDialog(
                    title: Text("Branş Ekle", style: TextStyle(color: Colors.black),),
                    backgroundColor: Colors.white,
                    content: SizedBox(
                      height: 80,
                      child: Column(
                        children:  <Widget>[
                          TextField(
                            controller: _branchNameTextController,
                            decoration: InputDecoration(
                              labelText: "Branş Adı",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text("İptal",style: TextStyle(color: Colors.black26,fontWeight: FontWeight.bold),),
                        onPressed: ()
                        {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text("Ekle",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        onPressed: ()
                        {
                          late String alinanVeri = _branchNameTextController.text;
                          _branchNameTextController.text = "";
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              }
          );

        },
        tooltip: "Branş Ekle",
        backgroundColor: Colors.blueGrey.shade200,
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //AIzaSyClaUkyL-cu_HS126nZxOtW3bfU9RExvh4

  Completer<GoogleMapController> haritaKontrol = Completer();

  var baslangicKonum = CameraPosition(target: LatLng(38.7412482, 26.1844276), zoom: 4,);

  List<Marker> isaretler = <Marker>[];

  Future<void> konumaGit() async
  {
    GoogleMapController controller = await haritaKontrol.future;

    var gidilecekIsaret = Marker(
      markerId: MarkerId("id"),
      position: LatLng(41.0039643, 28.4517462),
      infoWindow: InfoWindow(title: "İstanbul", snippet: "Evim"),
    );

    setState(() {
      isaretler.add(gidilecekIsaret);
    });

    var yeniKonum = CameraPosition(target: LatLng(41.0039643, 28.4517462), zoom: 12);

    controller.animateCamera(CameraUpdate.newCameraPosition(yeniKonum));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Haritalar"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 300,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: baslangicKonum,
                markers: Set<Marker>.of(isaretler),
                onMapCreated: (GoogleMapController controller)
                {
                  haritaKontrol.complete(controller);
                },
              ),
            ),
            ElevatedButton(
                child: Text("Konuma Git"),
              onPressed: ()
              {
                konumaGit();
              },
            ),
          ],
        ),
      ),
    );
  }
}

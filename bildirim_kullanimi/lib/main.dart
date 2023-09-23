import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var flp = FlutterLocalNotificationsPlugin();

  Future<void> kurulum() async
  {
    var androidAdyari = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosAyari = const DarwinInitializationSettings();
    var kurulumAyari = InitializationSettings(android: androidAdyari,iOS: iosAyari);
    await flp.initialize(kurulumAyari,onDidReceiveNotificationResponse: bildirimSecilme);
  }
  Future<void> bildirimSecilme(NotificationResponse notificationResponse) async
  {
    var payload = notificationResponse.payload;
    if(payload != null)
    {
      print("Bildirim Seçildi: $payload");
    }
  }

  @override
  void initState() {
    super.initState();
    kurulum();
  }


  Future<void> bildirimGoster() async
  {
    var androidBildirimDetay = AndroidNotificationDetails("kanalId", "kanalBaşlık", importance: Importance.max,);
    var iosBildirimDetay = const DarwinNotificationDetails();
    var bildirimDetay = NotificationDetails(iOS: iosBildirimDetay, android: androidBildirimDetay);

    await flp.show(0, "Başlık", "İçerik", bildirimDetay,payload: "Payload İçerik");
  }

  Future<void> gecikmeliGoster() async
  {
    var androidBildirimDetay = AndroidNotificationDetails("kanalId", "kanalBaşlık", importance: Importance.max,);
    var iosBildirimDetay = const DarwinNotificationDetails();
    var bildirimDetay = NotificationDetails(iOS: iosBildirimDetay, android: androidBildirimDetay);

    tz.initializeTimeZones();

    var gecikme = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10));

    await flp.zonedSchedule(
        0,
        "Gecikmeli Başlık",
        "İçerik Gecikmeli",
        gecikme,
        bildirimDetay,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: "İçerik Gecikmeli"
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Bildirim Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: ()
            {
              bildirimGoster();
            },
              child: const Text("Bildirim Oluştur"),),
            ElevatedButton(onPressed: ()
            {
              gecikmeliGoster();
            },
              child: const Text("Bildirim Oluştur (Gecikmeli)"),),
          ],
        ),
      ),
    );
  }
}

import 'package:bloc_kullanimi/ikinciSayfa.dart';
import 'package:bloc_kullanimi/sayacCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sayacCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: Anasayfa(),
      ),
    );
  }
}

class Anasayfa extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Bloc Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<sayacCubit, int>(
              builder: (context, sayacDegeri)
              {
                return Text("$sayacDegeri",style: TextStyle(fontSize: 36),);
              },
            ),
            ElevatedButton(
                child: Text("Geçiş Yap"),
              onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ikinciSayfa()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

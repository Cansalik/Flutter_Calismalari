import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/AnasayfaCubit.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/KisiDetayCubit.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/KisiKayitCubit.dart';
import 'package:kisiler_utgulamasi_pattern/views/anasayfa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KisiKayitCubit()),
        BlocProvider(create: (context) => KisiDetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: Anasayfa(),
      ),
    );
  }
}


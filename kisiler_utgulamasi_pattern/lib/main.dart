import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/HomePage_Cubit.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/ContactDetail_Cubit.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/ContactAdd_Cubit.dart';
import 'package:kisiler_utgulamasi_pattern/Views/HomePage.dart';

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
        BlocProvider(create: (context) => ContactAdd_Cubit()),
        BlocProvider(create: (context) => ContactDetail_Cubit()),
        BlocProvider(create: (context) => HomePage_Cubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: HomePage(),
      ),
    );
  }
}


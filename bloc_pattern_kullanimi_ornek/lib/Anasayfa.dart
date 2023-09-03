import 'package:bloc_pattern_kullanimi_ornek/AnasayfaCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var tfSayi1 = TextEditingController();
  var tfSayi2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern için Örnek"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AnasayfaCubit,int>(
                builder: (context,sonuc)
                {
                  return Text("${sonuc.toString()}",style: const TextStyle(fontSize: 30),);
                },
              ),
              TextField(controller: tfSayi1, decoration: const InputDecoration(hintText: "Sayı 1"),),
              TextField(controller: tfSayi2, decoration: const InputDecoration(hintText: "Sayı 2"),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text("TOPLA"),
                    onPressed: ()
                    {
                      String alinanSayi1 = tfSayi1.text;
                      String alinanSayi2 = tfSayi2.text;
                      context.read<AnasayfaCubit>().toplamaYap(alinanSayi1, alinanSayi2);
                    },
                  ),
                  ElevatedButton(
                    child: const Text("ÇARP"),
                    onPressed: ()
                    {
                      String alinanSayi1 = tfSayi1.text;
                      String alinanSayi2 = tfSayi2.text;
                      context.read<AnasayfaCubit>().carpmaYap(alinanSayi1, alinanSayi2);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

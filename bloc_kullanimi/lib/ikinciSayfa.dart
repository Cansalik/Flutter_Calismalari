import 'package:bloc_kullanimi/sayacCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ikinciSayfa extends StatelessWidget {
  const ikinciSayfa({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("İkinci Sayfa"),
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
              child: Text("Sayaç Arttır"),
              onPressed: ()
              {
                context.read<sayacCubit>().sayaciArttir(5);
              },
            ),
            ElevatedButton(
              child: Text("Sayaç Azalt"),
              onPressed: ()
              {
                context.read<sayacCubit>().sayaciAzalt(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

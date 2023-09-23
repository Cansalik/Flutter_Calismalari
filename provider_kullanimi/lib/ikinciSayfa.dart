import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_kullanimi/sayacModel.dart';

class ikinciSayfa extends StatelessWidget {
  const ikinciSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("İkinci Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<sayacModel>(
              builder: (context, sayacModelNesne,child)
              {
                return Text("${sayacModelNesne.sayacOku()}",style: TextStyle(fontSize: 30),);
              }
            ),
            Consumer<sayacModel>(
                builder: (context, sayacModelNesne,child)
                {
                  return ElevatedButton(
                    child: Text("Sayaç Arttır"),
                    onPressed: ()
                    {
                      sayacModelNesne.sayacArttir();
                    },
                  );
                }
            ),
            Consumer<sayacModel>(
                builder: (context, sayacModelNesne,child)
                {
                  return ElevatedButton(
                    child: Text("Sayaç Azalt"),
                    onPressed: ()
                    {
                      sayacModelNesne.sayacAzalt(2);
                    },
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}

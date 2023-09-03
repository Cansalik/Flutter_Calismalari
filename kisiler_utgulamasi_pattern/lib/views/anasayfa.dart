import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/Cubit/AnasayfaCubit.dart';
import 'package:kisiler_utgulamasi_pattern/entity/Kisiler.dart';
import 'package:kisiler_utgulamasi_pattern/views/kisi_detay_sayfa.dart';
import 'package:kisiler_utgulamasi_pattern/views/kisi_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ? TextField(
          style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Ara",
            hintStyle: TextStyle(color: Colors.white),
        ),
        autofocus: true,
        onChanged: (aramaSonucu)
        {
          context.read<AnasayfaCubit>().ara(aramaSonucu);
        },
        ) : const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: ()
            {
              setState(() {
                aramaYapiliyorMu = false;
                context.read<AnasayfaCubit>().kisileriYukle();
              });
            }, icon: Icon(Icons.cancel),) :
          IconButton(onPressed: ()
          {
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: Icon(Icons.search),)
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Kisiler>>(
        builder: (context, kisilerListesi)
        {
          if(kisilerListesi.isNotEmpty)
          {
            return ListView.builder(
              itemCount: kisilerListesi.length,
              itemBuilder: (context, index)
              {
                var kisi = kisilerListesi[index];
                return GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KisiDetaySayfa(kisi: kisi))).then((value) =>
                    {
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                          Spacer(),
                          IconButton(onPressed: ()
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${kisi.kisi_ad} Silinsin mi ?"),
                                action: SnackBarAction(
                                  label: "EVET",
                                  onPressed: ()
                                  {
                                    context.read<AnasayfaCubit>().sil(kisi.kisi_id);
                                  },
                                ),
                              ),
                            );
                          }, icon: Icon(Icons.delete_outline),color: Colors.black54,),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else
          {
            return const Center();
          }
        },

      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => KisiKayitSayfa())).then((value) =>
            {
              print("Anasayfaya Dönüldü"),
            });
          },
      ),
    );
  }
}

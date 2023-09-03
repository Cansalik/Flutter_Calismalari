import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/repo/KisilerDAO_Repository.dart';

class KisiKayitCubit extends Cubit<void>
{
  KisiKayitCubit() : super(0);

  var kisiRepo = KisilerRepository();

  Future<void> kayit(String kisi_ad, String kisi_tel) async
  {
    await kisiRepo.kisiKayit(kisi_ad, kisi_tel);
  }
}
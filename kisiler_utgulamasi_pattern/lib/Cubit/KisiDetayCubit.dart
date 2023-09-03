import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_utgulamasi_pattern/repo/KisilerDAO_Repository.dart';

class KisiDetayCubit extends Cubit<void>
{
  KisiDetayCubit() : super(0);

  var kisiRepo = KisilerRepository();

  Future<void> guncelle(String kisi_id,String kisi_ad, String kisi_tel) async
  {
    await kisiRepo.kisiGuncelle(kisi_id, kisi_ad, kisi_tel);
  }
}
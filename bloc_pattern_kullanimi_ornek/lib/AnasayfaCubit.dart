import 'package:bloc_pattern_kullanimi_ornek/MatematikRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int>
{
  AnasayfaCubit() : super(0);

  var matRepo = MatematikRepository();

  void toplamaYap(String alinanSayi1, String alinanSayi2)
  {
    emit(matRepo.toplam(alinanSayi1, alinanSayi2));
  }

  void carpmaYap(String alinanSayi1, String alinanSayi2)
  {
    emit(matRepo.carp(alinanSayi1, alinanSayi2));
  }
}
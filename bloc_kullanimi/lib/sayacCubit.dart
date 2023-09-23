import 'package:flutter_bloc/flutter_bloc.dart';

class sayacCubit extends Cubit<int>
{
  sayacCubit():super(0);


  void sayaciArttir(int miktar)
  {
    int sayac = state + miktar;
    emit(sayac);
  }

  void sayaciAzalt(int miktar)
  {
    int sayac = state - miktar;
    emit(sayac);
  }
}
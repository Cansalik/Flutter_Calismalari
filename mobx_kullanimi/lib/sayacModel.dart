import 'package:mobx/mobx.dart';

part 'sayacModel.g.dart';

class sayacModel = sayacModelBase with _$sayacModel;


abstract class sayacModelBase with Store
{
  @observable
  late int sayac = 0;


  @action
  void sayaciArttir(int miktar)
  {
    sayac = sayac + miktar;
  }

  @action
  void sayaciAzalt(int miktar)
  {
    sayac = sayac - miktar;
  }
}
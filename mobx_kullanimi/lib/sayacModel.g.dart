// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayacModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$sayacModel on sayacModelBase, Store {
  late final _$sayacAtom = Atom(name: 'sayacModelBase.sayac', context: context);

  @override
  int get sayac {
    _$sayacAtom.reportRead();
    return super.sayac;
  }

  @override
  set sayac(int value) {
    _$sayacAtom.reportWrite(value, super.sayac, () {
      super.sayac = value;
    });
  }

  late final _$sayacModelBaseActionController =
      ActionController(name: 'sayacModelBase', context: context);

  @override
  void sayaciArttir(int miktar) {
    final _$actionInfo = _$sayacModelBaseActionController.startAction(
        name: 'sayacModelBase.sayaciArttir');
    try {
      return super.sayaciArttir(miktar);
    } finally {
      _$sayacModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sayaciAzalt(int miktar) {
    final _$actionInfo = _$sayacModelBaseActionController.startAction(
        name: 'sayacModelBase.sayaciAzalt');
    try {
      return super.sayaciAzalt(miktar);
    } finally {
      _$sayacModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sayac: ${sayac}
    ''';
  }
}

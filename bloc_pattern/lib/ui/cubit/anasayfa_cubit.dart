import 'package:bloc_pattern/data/repo/matematikrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int> {
  AnasayfaCubit() : super(0);

  var mrepo = Matematikrepository();

  void toplamaYap(String alinanSayi1, alinanSayi2) {
    emit(mrepo.toplamaYap(alinanSayi1, alinanSayi2));
  }

  void carpmaYap(String alinanSayi1, alinanSayi2) {
    emit(mrepo.toplamaYap(alinanSayi1, alinanSayi2));
  }
}

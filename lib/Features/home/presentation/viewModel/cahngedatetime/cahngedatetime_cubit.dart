import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cahngedatetime_state.dart';

class CahngedatetimeCubit extends Cubit<CahngedatetimeState> {
  CahngedatetimeCubit() : super(CahngedatetimeInitial());

  changeDateTime({required bool isTime, required int index}) {
    if (isTime) {
      emit(CahngeTime(index: index));
    } else {
      emit(CahngeDate(index: index));
    }
  }
}

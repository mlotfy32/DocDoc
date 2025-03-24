import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:meta/meta.dart';

part 'change_checkbox_state.dart';

class ChangeCheckboxCubit extends Cubit<ChangeCheckboxState> {
  ChangeCheckboxCubit() : super(ChangeCheckboxInitial());
  changeCheck({required bool isChecked}) async {
    emit(ChangeCheckbox(isChecked: isChecked));
    await SharedPref().setBoolean(PrefsKeys.rememberMe, isChecked);
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'passwordvisability_state.dart';

class PasswordvisabilityCubit extends Cubit<PasswordvisabilityState> {
  PasswordvisabilityCubit() : super(PasswordvisabilityInitial());

  changeVisability({required bool isVisable}) {
    emit(Passwordvisability(isPasswordVisible: isVisable));
  }
}

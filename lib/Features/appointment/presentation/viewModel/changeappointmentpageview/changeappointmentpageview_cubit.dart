import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changeappointmentpageview_state.dart';

class ChangeappointmentpageviewCubit
    extends Cubit<ChangeappointmentpageviewState> {
  ChangeappointmentpageviewCubit() : super(ChangeappointmentpageviewInitial());
  changeApointPageView({required int index}) {
    emit(Changeappointmentpageview(index: index));
  }
}

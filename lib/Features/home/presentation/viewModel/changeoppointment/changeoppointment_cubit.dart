import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changeoppointment_state.dart';

class ChangeoppointmentCubit extends Cubit<ChangeoppointmentState> {
  ChangeoppointmentCubit() : super(ChangeoppointmentInitial());

  changOoppoint({required int activeStep}) {
    int newValue = activeStep + 1;
    emit(Changeoppointment(activeStep: newValue));
  }
}

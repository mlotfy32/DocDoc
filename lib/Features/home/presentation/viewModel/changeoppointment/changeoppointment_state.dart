part of 'changeoppointment_cubit.dart';

@immutable
abstract class ChangeoppointmentState {}

class ChangeoppointmentInitial extends ChangeoppointmentState {}

class Changeoppointment extends ChangeoppointmentState {
  final int activeStep;

  Changeoppointment({required this.activeStep});
}

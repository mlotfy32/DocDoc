part of 'changeappointmentpageview_cubit.dart';

@immutable
abstract class ChangeappointmentpageviewState {}

class ChangeappointmentpageviewInitial extends ChangeappointmentpageviewState {}

class Changeappointmentpageview extends ChangeappointmentpageviewState {
  final int index;

  Changeappointmentpageview({required this.index});
}

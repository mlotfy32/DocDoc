part of 'getallappointment_cubit.dart';

@immutable
abstract class GetallappointmentState {}

class GetallappointmentInitial extends GetallappointmentState {}

class GetallappointmentLoading extends GetallappointmentState {}

class GetallappointmentSuccess extends GetallappointmentState {
  final List<AppointmentMode> appointments;

  GetallappointmentSuccess({required this.appointments});
}

class GetallappointmentFailure extends GetallappointmentState {
  final String error;

  GetallappointmentFailure({required this.error});
}

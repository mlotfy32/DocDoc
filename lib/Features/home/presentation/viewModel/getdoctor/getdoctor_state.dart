part of 'getdoctor_cubit.dart';

@immutable
abstract class GetdoctorState {}

class GetdoctorInitial extends GetdoctorState {}

class GetdoctorLoading extends GetdoctorState {}

class GetdoctorSuccess extends GetdoctorState {
  final GetDoctors doctor;

  GetdoctorSuccess({required this.doctor});
}

class GetdoctorFailure extends GetdoctorState {}

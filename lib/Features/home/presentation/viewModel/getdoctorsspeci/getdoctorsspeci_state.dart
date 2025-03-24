part of 'getdoctorsspeci_cubit.dart';

@immutable
abstract class GetdoctorsspeciState {}

class GetdoctorsspeciInitial extends GetdoctorsspeciState {}

class GetdoctorsspecLoading extends GetdoctorsspeciState {}

class GetdoctorsspecSuccess extends GetdoctorsspeciState {
  final List<GetDoctors> doctors;

  GetdoctorsspecSuccess({required this.doctors});
}

class GetdoctorsspeciFailure extends GetdoctorsspeciState {
  final String error;

  GetdoctorsspeciFailure({required this.error});
}

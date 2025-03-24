part of 'getalldoctors_cubit.dart';

@immutable
abstract class GetalldoctorsState {}

class GetalldoctorsInitial extends GetalldoctorsState {}

class GetalldoctorsLoading extends GetalldoctorsState {}

class GetalldoctorsSuccess extends GetalldoctorsState {
  final List<GetDoctors> doctors;

  GetalldoctorsSuccess({required this.doctors});
}

class GetalldoctorsFailure extends GetalldoctorsState {
  final String error;

  GetalldoctorsFailure({required this.error});
}

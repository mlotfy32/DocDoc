part of 'searchdoctor_cubit.dart';

@immutable
abstract class SearchdoctorState {}

class SearchdoctorInitial extends SearchdoctorState {}

class SearchdoctorLoading extends SearchdoctorState {}

class SearchdoctorSuccess extends SearchdoctorState {
  final List<GetDoctors> doctors;

  SearchdoctorSuccess({required this.doctors});
}

class SearchdoctorFailure extends SearchdoctorState {
  final String error;

  SearchdoctorFailure({required this.error});
}

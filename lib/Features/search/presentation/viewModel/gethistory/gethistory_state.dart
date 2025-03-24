part of 'gethistory_cubit.dart';

@immutable
abstract class GethistoryState {}

class GethistoryInitial extends GethistoryState {}

class GethistoryLoading extends GethistoryState {}

class GethistorySuccess extends GethistoryState {
  final List<SearchModel> history;

  GethistorySuccess({required this.history});
}

class GethistoryEmpty extends GethistoryState {}

class GethistoryFailure extends GethistoryState {
  final String error;

  GethistoryFailure({required this.error});
}

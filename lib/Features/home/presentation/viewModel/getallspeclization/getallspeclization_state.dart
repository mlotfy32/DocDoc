part of 'getallspeclization_cubit.dart';

@immutable
abstract class GetallspeclizationState {}

class GetallspeclizationInitial extends GetallspeclizationState {}

class GetallspeclizationLoading extends GetallspeclizationState {}

class GetallspeclizationSuccess extends GetallspeclizationState {
  final List<Getspeclizationres> data;

  GetallspeclizationSuccess({required this.data});
}

class GetallspeclizationFailure extends GetallspeclizationState {
  final String error;

  GetallspeclizationFailure({required this.error});
}

part of 'cahngedatetime_cubit.dart';

@immutable
abstract class CahngedatetimeState {}

class CahngedatetimeInitial extends CahngedatetimeState {}

class CahngeDate extends CahngedatetimeState {
  final int index;

  CahngeDate({required this.index});
}

class CahngeTime extends CahngedatetimeState {
  final int index;

  CahngeTime({required this.index});
}

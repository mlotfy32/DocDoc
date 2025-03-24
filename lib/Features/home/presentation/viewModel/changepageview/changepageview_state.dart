part of 'changepageview_cubit.dart';

@immutable
abstract class ChangepageviewState {}

class ChangepageviewInitial extends ChangepageviewState {}

class ChangepageviewLoading extends ChangepageviewState {
  final int index;

  ChangepageviewLoading({required this.index});
}

class Changepageview extends ChangepageviewState {
  final int index;

  Changepageview({required this.index});
}

//
class ChangepageviewMap extends ChangepageviewState {
  final int index;
  final CameraPosition cameraPosition;

  ChangepageviewMap({required this.index, required this.cameraPosition});
}

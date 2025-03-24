part of 'changepageviewcontent_cubit.dart';

@immutable
abstract class ChangepageviewcontentState {}

class ChangepageviewcontentInitial extends ChangepageviewcontentState {}

class ChangepageviewcontentLoading extends ChangepageviewcontentState {}

class ChangepageviewcontentSuccess extends ChangepageviewcontentState {
  final CameraPosition cameraPosition;
  final LatLng latLng;

  ChangepageviewcontentSuccess(this.latLng, {required this.cameraPosition});
}

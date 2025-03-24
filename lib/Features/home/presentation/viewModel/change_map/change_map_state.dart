part of 'change_map_cubit.dart';

@immutable
abstract class ChangeMapState {}

class ChangeMapInitial extends ChangeMapState {}

class ChangeMapLoading extends ChangeMapState {}

class ChangeMapSuccess extends ChangeMapState {
  final CameraPosition cameraPosition;

  ChangeMapSuccess({required this.cameraPosition});
}

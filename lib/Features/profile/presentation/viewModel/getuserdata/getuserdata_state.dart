part of 'getuserdata_cubit.dart';

@immutable
abstract class GetuserdataState {}

class GetuserdataInitial extends GetuserdataState {}

class GetuserdataLoading extends GetuserdataState {}

class GetuserdataSuccess extends GetuserdataState {
  final String userName;
  final String userImage;
  final String userEmail;
  final String userPhone;

  GetuserdataSuccess(
      {required this.userName,
      required this.userImage,
      required this.userPhone,
      required this.userEmail});
}

class GetuserdataFailure extends GetuserdataState {
  final String errorMessage;

  GetuserdataFailure({required this.errorMessage});
}

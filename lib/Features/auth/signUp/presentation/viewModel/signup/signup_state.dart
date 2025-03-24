part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final SignUpResSuccess data;

  SignupSuccess({required this.data});
}

class SignupFailure extends SignupState {
  final SignUpResFailure data;

  SignupFailure({required this.data});
}

class ImageLoading extends SignupState {}

class ImageSuccess extends SignupState {
  final String image;

  ImageSuccess({required this.image});
}

class ImageFailure extends SignupState {}

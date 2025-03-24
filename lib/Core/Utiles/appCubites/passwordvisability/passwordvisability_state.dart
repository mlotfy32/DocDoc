part of 'passwordvisability_cubit.dart';

@immutable
abstract class PasswordvisabilityState {}

class PasswordvisabilityInitial extends PasswordvisabilityState {}

class Passwordvisability extends PasswordvisabilityState {
  final bool isPasswordVisible;

  Passwordvisability({required this.isPasswordVisible});
}

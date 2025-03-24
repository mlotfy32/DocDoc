part of 'changelang_cubit.dart';

@immutable
abstract class ChangelangState {}

class ChangelangInitial extends ChangelangState {}

class Changelang extends ChangelangState {
  final String language;

  Changelang({required this.language});
}

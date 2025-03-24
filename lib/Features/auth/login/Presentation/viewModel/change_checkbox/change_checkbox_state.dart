part of 'change_checkbox_cubit.dart';

@immutable
abstract class ChangeCheckboxState {}

class ChangeCheckboxInitial extends ChangeCheckboxState {}

class ChangeCheckbox extends ChangeCheckboxState {
  final bool isChecked;

  ChangeCheckbox({required this.isChecked});
}

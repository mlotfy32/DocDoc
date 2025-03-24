part of 'change_tab_cubit.dart';

@immutable
abstract class ChangeTabState {}

class ChangeTabInitial extends ChangeTabState {}

class ChangeTab extends ChangeTabState {
  final int tab;

  ChangeTab({required this.tab});
}

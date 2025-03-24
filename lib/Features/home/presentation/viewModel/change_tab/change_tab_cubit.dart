import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_tab_state.dart';

class ChangeTabCubit extends Cubit<ChangeTabState> {
  ChangeTabCubit() : super(ChangeTabInitial());

  changeTab({required int Tap}) {
    emit(ChangeTab(tab: Tap));
  }
}

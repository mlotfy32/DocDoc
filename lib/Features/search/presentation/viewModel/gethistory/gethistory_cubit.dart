import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/constans.dart';
import 'package:docdoc/Features/search/data/local/hiveSearch.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'gethistory_state.dart';

class GethistoryCubit extends Cubit<GethistoryState> {
  GethistoryCubit() : super(GethistoryInitial());

  getHistory() async {
    emit(GethistoryLoading());
    Box<SearchModel> searchModel = await Hive.box(Constans.hiveSearch);
    try {
      List<SearchModel> history = await searchModel.values.toList();
      if (history.isEmpty) {
        emit(GethistoryEmpty());
      } else {
        emit(GethistorySuccess(history: history));
      }
    } catch (e) {
      emit(GethistoryFailure(error: e.toString()));
    }
  }
}

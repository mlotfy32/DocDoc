import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/constans.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/search/data/local/hiveSearch.dart';
import 'package:docdoc/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'searchdoctor_state.dart';

class SearchdoctorCubit extends Cubit<SearchdoctorState> {
  SearchdoctorCubit() : super(SearchdoctorInitial());

  Future<void> searchDoctor({required SearchModel search}) async {
    emit(SearchdoctorLoading());
    Box<SearchModel> searchModel = await Hive.box(Constans.hiveSearch);
    searchModel.add(search);
    final result = await Apiservice().getAllDoctors(
        accessToken: accessToken!,
        endPoint: 'doctor/doctor-search?name=${search.search}');
    result.fold((l) {
      emit(SearchdoctorFailure(error: l.message));
    }, (r) {
      emit(SearchdoctorSuccess(doctors: r));
    });
  }
}

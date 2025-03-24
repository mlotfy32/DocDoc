import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/main.dart';
import 'package:meta/meta.dart';

part 'getallspeclization_state.dart';

class GetallspeclizationCubit extends Cubit<GetallspeclizationState> {
  GetallspeclizationCubit() : super(GetallspeclizationInitial());

  Getallspeclization() async {
    emit(GetallspeclizationLoading());
    final result = await Apiservice().getAllSpizations(
        accessToken: accessToken!, endPoint: 'specialization/index');
    result.fold((l) {
      emit(GetallspeclizationFailure(error: l.message));
    }, (r) {
      emit(GetallspeclizationSuccess(data: r));
    });
  }
}

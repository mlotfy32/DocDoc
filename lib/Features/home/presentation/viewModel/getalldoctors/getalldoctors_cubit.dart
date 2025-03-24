import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:meta/meta.dart';
import 'package:docdoc/main.dart';

part 'getalldoctors_state.dart';

class GetalldoctorsCubit extends Cubit<GetalldoctorsState> {
  GetalldoctorsCubit() : super(GetalldoctorsInitial());

  GetDoctors() async {
    emit(GetalldoctorsLoading());
    final result = await Apiservice().getAllDoctors(
      accessToken: accessToken!,
      endPoint: 'doctor/index',
    );
    result.fold((l) {
      emit(GetalldoctorsFailure(error: l.message));
    }, (r) {
      emit(GetalldoctorsSuccess(doctors: r));
    });
  }
}

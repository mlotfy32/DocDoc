import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/main.dart';
import 'package:meta/meta.dart';

part 'getdoctorsspeci_state.dart';

class GetdoctorsspeciCubit extends Cubit<GetdoctorsspeciState> {
  GetdoctorsspeciCubit() : super(GetdoctorsspeciInitial());

  getDoctorsSpeclization({required int id}) async {
    emit(GetdoctorsspecLoading());
    final result = await Apiservice().getSpizations(
        accessToken: accessToken!, endPoint: 'specialization/show', id: id);
    result.fold((l) {
      emit(GetdoctorsspeciFailure(error: l.message));
    }, (r) {
      emit(GetdoctorsspecSuccess(doctors: r));
    });
  }
}

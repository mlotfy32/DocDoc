import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/main.dart';
import 'package:meta/meta.dart';

part 'getdoctor_state.dart';

class GetdoctorCubit extends Cubit<GetdoctorState> {
  GetdoctorCubit() : super(GetdoctorInitial());
  GetDocror({required int id}) async {
    final result = await Apiservice()
        .getDoctor(accessToken: accessToken!, endPoint: 'doctor/show/$id');
    result.fold((l) {
      emit(GetdoctorFailure());
    }, (r) {
      emit(GetdoctorSuccess(doctor: r));
    });
  }
}

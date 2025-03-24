import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/services/cacheLogin.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Features/auth/signUp/data/signUpRes.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  Future<void> Signup(
      {required String name,
      required String phone,
      required String email,
      required String gender,
      required String password,
      required String profileUrl,
      required String endPoint}) async {
    emit(SignupLoading());
    final result = await Apiservice().SignUp(
        passwordConfirmation: password,
        profileUrl: profileUrl,
        email: email,
        password: password,
        phone: phone,
        name: name,
        gender: gender,
        endPoint: endPoint);
    result.fold((l) {
      emit(SignupFailure(data: l));
    }, (r) async {
      await Cachelogin.chachLogin(
          username: r.username,
          email: email,
          password: password,
          accessToken: r.token);
      emit(SignupSuccess(data: r));
    });
  }

  uploadImage({required String location}) async {
    emit(ImageLoading());
    try {
      SharedPref().setString(PrefsKeys.userImage, location);
      emit(ImageSuccess(image: location));
    } catch (e) {
      emit(ImageFailure());
    }
  }
}

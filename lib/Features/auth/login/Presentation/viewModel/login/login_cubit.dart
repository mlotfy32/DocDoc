import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/services/cacheLogin.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Features/auth/login/data/loginResModel.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  login(
      {required String email,
      required String password,
      required String endPoint}) async {
    emit(LoginLoading());
    final result = await Apiservice()
        .Login(email: email, password: password, endPoint: endPoint);
    result.fold((l) {
      emit(LoginFailure(error: l.message));
    }, (r) async {
      await Cachelogin.chachLogin(
          username: r.username,
          email: email,
          password: password,
          accessToken: r.token);
      emit(LoginSuccess(data: r));
    });
  }
}

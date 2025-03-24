import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:meta/meta.dart';

part 'getuserdata_state.dart';

class GetuserdataCubit extends Cubit<GetuserdataState> {
  GetuserdataCubit() : super(GetuserdataInitial());
  getUserData() async {
    emit(GetuserdataLoading());
    try {
      var userPhone = await SharedPref().getString(PrefsKeys.phone) == null
          ? '+201275******'
          : await SharedPref().getString(PrefsKeys.phone);
      var userName = await SharedPref().getString(PrefsKeys.userName) == null
          ? 'Mhmd Lotfy'
          : await SharedPref().getString(PrefsKeys.userName);
      var userImage = await SharedPref().getString(PrefsKeys.userImage) == null
          ? AppImages.userAvatar
          : await SharedPref().getString(PrefsKeys.userImage);
      var userEmail = await SharedPref().getString(PrefsKeys.email) == null
          ? 'mhmd@gmail.com'
          : await SharedPref().getString(PrefsKeys.email);
      emit(GetuserdataSuccess(
          userPhone: userPhone!,
          userName: userName!,
          userImage: userImage!,
          userEmail: userEmail!));
    } catch (e) {
      emit(GetuserdataFailure(errorMessage: e.toString()));
    }
  }
}

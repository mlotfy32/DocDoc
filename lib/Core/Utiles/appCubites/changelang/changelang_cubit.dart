import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'changelang_state.dart';

class ChangelangCubit extends Cubit<ChangelangState> {
  ChangelangCubit() : super(ChangelangInitial());
  String lang = 'en';
  getSavedLanguage() async {
    var language = SharedPref().getString(PrefsKeys.language);
    if (language != null) {
      if (language == 'en') {
        await SharedPref().setString(PrefsKeys.language, 'ar');
        Get.updateLocale(const Locale('ar'));
        lang = 'ar';
        emit(Changelang(language: 'ar'));
      } else {
        await SharedPref().setString(PrefsKeys.language, 'en');

        Get.updateLocale(const Locale('en'));
        lang = 'en';

        emit(Changelang(language: 'en'));
      }
    } else {
      await SharedPref().setString(PrefsKeys.language, 'en');

      Get.updateLocale(const Locale('en'));
      lang = 'en';

      emit(Changelang(language: 'en'));
    }
  }
}

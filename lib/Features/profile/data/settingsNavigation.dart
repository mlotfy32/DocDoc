import 'package:docdoc/Core/Utiles/appCubites/changelang/changelang_cubit.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/services/logout/logOut.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/profile/presentation/view/widgets/language.dart';
import 'package:docdoc/Features/profile/presentation/view/widgets/security.dart';
import 'package:docdoc/Features/profile/presentation/view/widgets/settingNotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Settingsnavigation {
  factory Settingsnavigation() {
    return instance;
  }
  Settingsnavigation._internal();
  static final Settingsnavigation instance = Settingsnavigation._internal();
  navigation({required int index}) {
    switch (index) {
      case 0:
        return Get.to(() => const Settingnotification(),
            curve: Appcurves.curves);
      case 1:
        return Get.to(() => const Security(), curve: Appcurves.curves);
      case 2:
        return Get.to(
            () => BlocProvider<ChangelangCubit>(
                  create: (context) => ChangelangCubit(),
                  child: const Language(),
                ),
            curve: Appcurves.curves);
      case 3:
        return Get.defaultDialog(
            title: LangKeys.logout.tr,
            titleStyle: AppFonts.f18w500,
            content: Text(
                textAlign: TextAlign.center,
                LangKeys.aboutLogOut.tr,
                style: AppFonts.f14w400),
            cancel: TextButton(
                onPressed: () => Get.back(),
                child: Text(LangKeys.cancel.tr,
                    style: AppFonts.f16w600.copyWith(color: Colors.blue))),
            confirm: TextButton(
                onPressed: () => Logout.logOut(),
                child: Text(LangKeys.logout.tr,
                    style: AppFonts.f16w600.copyWith(color: Colors.red))));
      // default:
      //   return SettingsPage();
    }
  }
}

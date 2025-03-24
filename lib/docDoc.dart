import 'dart:developer';

import 'package:docdoc/Core/Utiles/appCubites/changelang/changelang_cubit.dart';
import 'package:docdoc/Core/Utiles/env_variables.dart';
import 'package:docdoc/Core/Utiles/language/local.dart';
import 'package:docdoc/Core/Utiles/services/appContext.dart';
import 'package:docdoc/Features/auth/login/Presentation/viewModel/login/login_cubit.dart';
import 'package:docdoc/Features/auth/login/presentation/view/loginview.dart';
import 'package:docdoc/Features/home/presentation/view/homeView.dart';
import 'package:docdoc/Features/onBording/presentation/view/onBordingView.dart';
import 'package:docdoc/main.dart';
import 'package:docdoc/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DocDoc extends StatelessWidget {
  const DocDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
            // theme: ThemeData(fontFamily: 'Inter'),
            navigatorKey: Appcontext.navigatorState,
            translations: MyLocal(),
            locale: language == null ? const Locale('en') : Locale(language!),
            home: isRmemper == true && accessToken != null
                ? const Homeview()
                : const Onbordingview(),
          ),
        );
      },
    );
  }
}

import 'dart:convert';

import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCubites/changelang/changelang_cubit.dart';
import 'package:docdoc/Core/Utiles/env_variables.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Core/Utiles/services/push_Notification/notificationHelper.dart';
import 'package:docdoc/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LangKeys.language.tr)),
      body: Center(
        child: Image.network(AppImages.recommentedDoctors.first),
      ),
    );
  }
}

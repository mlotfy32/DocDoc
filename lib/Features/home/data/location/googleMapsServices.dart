import 'dart:developer';

import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/services/appContext.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Features/auth/login/Presentation/viewModel/login/login_cubit.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/findNearBy.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/markerTap.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getdoctor/getdoctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapServices {
  static final MapServices _instance = MapServices._internal();

  factory MapServices() {
    return _instance;
  }

  MapServices._internal();
  static getMarkers({required BuildContext context}) {
    Set<Marker> markers = {
      Marker(
          onTap: () {
            Get.snackbar('Doc Doc', '',
                backgroundColor: Colors.transparent,
                margin: const EdgeInsets.only(bottom: 10),
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 2),
                messageText: BlocProvider<GetdoctorCubit>(
                  create: (context) => GetdoctorCubit(),
                  child: const MarkerTap(id: 0),
                ));
          },
          markerId: const MarkerId('0'),
          position: const LatLng(30.714784, 31.253794)),
      Marker(
          onTap: () {
            Get.snackbar('Doc Doc', '',
                backgroundColor: Colors.transparent,
                margin: const EdgeInsets.only(bottom: 10),
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 2),
                messageText: BlocProvider<GetdoctorCubit>(
                  create: (context) => GetdoctorCubit(),
                  child: const MarkerTap(id: 1),
                ));
          },
          markerId: const MarkerId('1'),
          position: const LatLng(30.724775, 31.6327376)),
      Marker(
          onTap: () {
            Get.snackbar('Doc Doc', '',
                backgroundColor: Colors.transparent,
                margin: const EdgeInsets.only(bottom: 10),
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 2),
                messageText: BlocProvider<GetdoctorCubit>(
                  create: (context) => GetdoctorCubit(),
                  child: const MarkerTap(id: 2),
                ));
          },
          markerId: const MarkerId('2'),
          position: const LatLng(30.734766, 31.2517137)),
      Marker(
          onTap: () {
            Get.snackbar('Doc Doc', '',
                backgroundColor: Colors.transparent,
                margin: const EdgeInsets.only(bottom: 10),
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 2),
                messageText: BlocProvider<GetdoctorCubit>(
                  create: (context) => GetdoctorCubit(),
                  child: const MarkerTap(id: 3),
                ));
          },
          markerId: const MarkerId('3'),
          position: const LatLng(30.744757, 31.2507118)),
    };
    return markers;
  }
}

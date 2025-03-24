import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'changepageviewcontent_state.dart';

class ChangepageviewcontentCubit extends Cubit<ChangepageviewcontentState> {
  ChangepageviewcontentCubit() : super(ChangepageviewcontentInitial());
  changePageViewContent({required String cityName}) async {
    emit(ChangepageviewcontentLoading());
    bool isLocationAllowed = await Geolocator.isLocationServiceEnabled();
    await Geolocator.checkPermission().then((permission) async {
      if (permission != LocationPermission.denied) {
        try {
          List<Location> locations = await locationFromAddress(cityName);
          double? _latitude;
          double? _longitude;
          if (locations.isNotEmpty) {
            _latitude = locations[0].latitude;
            _longitude = locations[0].longitude;
          } else {
            _latitude = null;
            _longitude = null;
          }
          LatLng latLng = LatLng(_latitude!, _longitude!);
          CameraPosition cameraPosition =
              CameraPosition(target: latLng, zoom: 15);

          emit(ChangepageviewcontentSuccess(latLng,
              cameraPosition: cameraPosition));
        } on Exception catch (e) {
          Helper.FlutterToast(
              title: 'Can`t Load City Location', success: false);
        }
      } else {
        await Geolocator.requestPermission();
      }
    });
  }
}

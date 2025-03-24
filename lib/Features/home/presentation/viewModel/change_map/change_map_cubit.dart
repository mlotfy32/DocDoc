import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/findNearBy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'change_map_state.dart';

class ChangeMapCubit extends Cubit<ChangeMapState> {
  ChangeMapCubit() : super(ChangeMapInitial());

  chageMap() async {
    emit(ChangeMapLoading());
    bool isLocationAllowed = await Geolocator.isLocationServiceEnabled();
    await Geolocator.checkPermission().then((permission) async {
      if (permission != LocationPermission.denied) {
        Position position = await Geolocator.getCurrentPosition();
        // Position myPosition = await Geolocator.getPositionStream().first;

        LatLng latLng = LatLng(position.latitude, position.longitude);
        CameraPosition cameraPosition =
            CameraPosition(target: latLng, zoom: 15);

        emit(ChangeMapSuccess(cameraPosition: cameraPosition));
      } else {
        await Geolocator.requestPermission();
        chageMap();
      }
    });
  }
}

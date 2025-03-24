import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'changepageview_state.dart';

class ChangepageviewCubit extends Cubit<ChangepageviewState> {
  ChangepageviewCubit() : super(ChangepageviewInitial());

  changePageView({required int index}) async {
    emit(Changepageview(index: index));
  }
}

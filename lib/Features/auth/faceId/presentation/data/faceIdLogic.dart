import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Features/home/presentation/view/homeView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';

class Faceidlogic {
  factory Faceidlogic(BuildContext context) {
    return _instance;
  }
  const Faceidlogic._();
  static final Faceidlogic _instance = const Faceidlogic._();
  Future<void> authenticate() async {
    final LocalAuthentication _localAuth = LocalAuthentication();

    bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
    bool isDeviceSupported = await _localAuth.isDeviceSupported();

    if (!canCheckBiometrics || !isDeviceSupported) {
      return;
    }

    try {
      await requestCameraPermission();

      bool authenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate to access the app',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (authenticated) {
        Helper.FlutterToast(
            title: 'Fingerprint Added successful!', success: true);
        await SharedPref().setBoolean(PrefsKeys.hasFaceId, true);
        Get.offAll(() => const Homeview(), curve: Appcurves.curves);
      } else {
        Helper.FlutterToast(title: 'Authentication failed.', success: true);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.camera.request();
      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
}

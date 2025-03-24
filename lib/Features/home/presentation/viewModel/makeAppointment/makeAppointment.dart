import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/main.dart';

class Makeappointment {
  Future<void> makeAppointment({required String doctorId}) async {
    Apiservice().makeAppointment(
        accessToken: accessToken!,
        endPoint: 'appointment/store',
        start_time: '2025-10-10 14:00',
        doctor_id: doctorId,
        patient_id: '2432',
        notes: '');
  }
}

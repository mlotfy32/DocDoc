import 'package:bloc/bloc.dart';
import 'package:docdoc/Core/Utiles/constans.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:docdoc/Core/Utiles/services/push_Notification/notificationHelper.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Features/appointment/data/appointmentMode.dart';
import 'package:docdoc/Features/home/data/models/patientModelRes.dart';
import 'package:docdoc/main.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
part 'getallappointment_state.dart';

class GetallappointmentCubit extends Cubit<GetallappointmentState> {
  GetallappointmentCubit() : super(GetallappointmentInitial());
  Future<void> getAllAppointment() async {
    emit(GetallappointmentLoading());
    Box<AppointmentMode> searchModel = await Hive.box(Constans.hiveAppointment);
    try {
      List<AppointmentMode> data = await searchModel.values.toList();
      emit(GetallappointmentSuccess(appointments: data));
    } catch (e) {
      emit(GetallappointmentFailure(error: e.toString()));
    }
  }

  Future<void> setAppointment({required AppointmentMode appoin}) async {
    Box<AppointmentMode> appointment = await Hive.box(Constans.hiveAppointment);
    try {
      await appointment.add(appoin);
      var name = await SharedPref().getString(PrefsKeys.userName);
      await NotificationsHelper().sendTopicNotification(
          notificationTitle: 'Hi Mhmd', notificationBody: 'Appointment Booked');
    } catch (e) {
      Helper.FlutterToast(title: 'Appointment Not Booked', success: false);
    }
  }
}

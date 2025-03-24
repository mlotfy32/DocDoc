import 'package:docdoc/Core/Utiles/7.1%20bloc_observer.dart';
import 'package:docdoc/Core/Utiles/constans.dart';
import 'package:docdoc/Core/Utiles/env_variables.dart';
import 'package:docdoc/Core/Utiles/services/push_Notification/localNotification.dart';
import 'package:docdoc/Core/Utiles/services/push_Notification/notificationHelper.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Features/appointment/data/appointmentMode.dart';
import 'package:docdoc/Features/search/data/local/hiveSearch.dart';
import 'package:docdoc/docDoc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var isRmemper = SharedPref().getBoolean(PrefsKeys.rememberMe);
var accessToken = SharedPref().getString(PrefsKeys.accessToken);
var language = SharedPref().getString(PrefsKeys.language);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await NotificationsHelper().initNotifications();
  await Hive.initFlutter();
  Hive.registerAdapter(SearchModelAdapter());
  await Hive.openBox<SearchModel>(Constans.hiveSearch);
  Hive.registerAdapter(AppointmentModeAdapter());
  await Hive.openBox<AppointmentMode>(Constans.hiveAppointment);
  await SharedPref().instantiatePreferences();
  LocalNotificationService.init();
  await EnvVariable.instance.init(envType: EnvTypeEnum.prod);

  runApp(const DocDoc());
  Bloc.observer = AppBlocObserver();
}

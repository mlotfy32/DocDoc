import 'package:hive/hive.dart';
part 'appointmentMode.g.dart';

@HiveType(typeId: 1)
class AppointmentMode extends HiveObject {
  @HiveField(0)
  String doctorName;
  @HiveField(1)
  String general;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
  @HiveField(4)
  DateTime dateTime;
  @HiveField(5)
  String doctorImage;
  AppointmentMode(
      {required this.doctorName,
      required this.general,
      required this.date,
      required this.time,
      required this.dateTime,
      required this.doctorImage});
}

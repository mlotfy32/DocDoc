import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';

class Patientmodelres {
  final GetDoctors doctors;
  final int id;
  final String name;
  final String email;
  final String gender;
  final String phone;
  final String appointment_time;
  final String appointment_end_time;
  final String status;
  final String notes;
  final int appointment_price;

  Patientmodelres(
      {required this.appointment_time,
      required this.appointment_end_time,
      required this.status,
      required this.notes,
      required this.appointment_price,
      required this.doctors,
      required this.id,
      required this.name,
      required this.email,
      required this.gender,
      required this.phone});
  factory Patientmodelres.fromJson(data) {
    return Patientmodelres(
        doctors: data['doctor'],
        appointment_end_time: data['appointment_end_time'],
        appointment_price: data['appointment_price'],
        appointment_time: data['appointment_time'],
        notes: data['notes'],
        status: data['status'],
        id: data['patient']['id'],
        name: data['patient']['name'],
        email: data['patient']['email'],
        gender: data['patient']['gender'],
        phone: data['patient']['phone']);
  }
}

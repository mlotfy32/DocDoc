import 'package:docdoc/Features/appointment/presentation/viewModel/getAllAppointment/getallappointment_cubit.dart';
import 'package:docdoc/Features/notification/presentation/view/widgets/notificationViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notificationview extends StatelessWidget {
  const Notificationview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetallappointmentCubit>(
      create: (context) => GetallappointmentCubit(),
      child: const Notificationviewbody(),
    );
  }
}

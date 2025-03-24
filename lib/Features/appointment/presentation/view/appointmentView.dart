import 'package:docdoc/Features/appointment/presentation/view/widgets/appointmentViewBody.dart';
import 'package:docdoc/Features/appointment/presentation/viewModel/changeappointmentpageview/changeappointmentpageview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Appointmentview extends StatelessWidget {
  const Appointmentview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangeappointmentpageviewCubit>(
      create: (context) => ChangeappointmentpageviewCubit(),
      child: const Appointmentviewbody(),
    );
  }
}

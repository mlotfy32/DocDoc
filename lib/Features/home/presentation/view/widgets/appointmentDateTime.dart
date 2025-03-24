import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/appointmentCursor.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/appointmentType.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/timeGrid.dart';
import 'package:docdoc/Features/home/presentation/viewModel/cahngedatetime/cahngedatetime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentDateTime extends StatelessWidget {
  const AppointmentDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    int activeStep = 0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Date & Time",
                style: TextStyle(
                    fontWeight:
                        activeStep == 0 ? FontWeight.bold : FontWeight.normal)),
            Text("Payment",
                style: TextStyle(
                    fontWeight:
                        activeStep == 1 ? FontWeight.bold : FontWeight.normal)),
            Text("Summary",
                style: TextStyle(
                    fontWeight:
                        activeStep == 2 ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          textAlign: TextAlign.start,
          'Select Data',
          style: AppFonts.f18w700,
        ),
        const SizedBox(height: 8),
        BlocProvider<CahngedatetimeCubit>(
          create: (context) => CahngedatetimeCubit(),
          child: Cursor(),
        ),
        const SizedBox(height: 8),
        Text(
          'Available time',
          style: AppFonts.f18w700,
        ),
        BlocProvider<CahngedatetimeCubit>(
          create: (context) => CahngedatetimeCubit(),
          child: const TimeGrid(),
        ),
        Text(
          'Appointment Type',
          style: AppFonts.f18w700,
        ),
        const AppointmentType(),
        const SizedBox(height: 6),
      ],
    );
  }
}

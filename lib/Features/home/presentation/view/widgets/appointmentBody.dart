import 'dart:developer';

import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/appointment/data/appointmentMode.dart';
import 'package:docdoc/Features/appointment/presentation/viewModel/getAllAppointment/getallappointment_cubit.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/appointmentDateTime.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/bookingInformation.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/paymentOptions.dart';
import 'package:docdoc/Features/home/presentation/viewModel/changeoppointment/changeoppointment_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/makeAppointment/makeAppointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';

class MackAppointmentBody extends StatelessWidget {
  const MackAppointmentBody(
      {super.key,
      required this.doctor,
      required this.review,
      required this.doctorImage});
  final GetDoctors doctor;
  final String review;
  final String doctorImage;
  @override
  Widget build(BuildContext context) {
    int activeStep = 0;

    int selectedIndex = 2;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        color: Colors.white,
        width: Get.size.width,
        height: Get.size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            BlocBuilder<ChangeoppointmentCubit, ChangeoppointmentState>(
                builder: (context, state) {
              activeStep =
                  state is Changeoppointment ? state.activeStep : activeStep;
              if (state is Changeoppointment) {
                return NumberStepper(
                  activeStep: state.activeStep,
                  numbers: const [1, 2, 3],
                  activeStepColor: Colors.blue,
                  stepColor: Colors.teal,
                  numberStyle: const TextStyle(color: Colors.white),
                  lineColor: Colors.teal,
                );
              } else {
                return NumberStepper(
                  numbers: const [1, 2, 3],
                  activeStepColor: Colors.blue,
                  stepColor: Colors.teal,
                  numberStyle: const TextStyle(color: Colors.white),
                  lineColor: Colors.teal,
                );
              }
            }),
            const SizedBox(height: 20),
            BlocBuilder<ChangeoppointmentCubit, ChangeoppointmentState>(
                builder: (context, state) {
              if (state is Changeoppointment) {
                if (state.activeStep == 1) {
                  return const PaymentOptions();
                } else if (state.activeStep == 2) {
                  return BookingInformation(
                    doctorImage: doctorImage,
                    review: review,
                    doctor: doctor,
                  );
                } else {
                  return const AppointmentDateTime();
                }
              } else {
                return const AppointmentDateTime();
              }
            }),
            const SizedBox(height: 10),
            Customelinearbutton(
                onTap: () async {
                  log(activeStep.toString());
                  if (activeStep < 2) {
                    BlocProvider.of<ChangeoppointmentCubit>(context)
                        .changOoppoint(activeStep: activeStep);
                  } else if (activeStep == 2) {
                    await BlocProvider.of<GetallappointmentCubit>(context)
                        .setAppointment(
                            appoin: AppointmentMode(
                                doctorName: 'DR.${doctor.name}',
                                date: 'wed, 26 Mar',
                                general: 'Medical Checkup',
                                time: '80:30 PM',
                                doctorImage: doctorImage,
                                dateTime: DateTime.now()));
                    Get.back();
                  }
                },
                child:
                    BlocBuilder<ChangeoppointmentCubit, ChangeoppointmentState>(
                  builder: (context, state) {
                    return Text(
                        state is Changeoppointment && state.activeStep == 2
                            ? 'Book Now'
                            : 'Continue',
                        style: AppFonts.f18w600);
                  },
                ),
                width: Get.size.width,
                height: 45,
                color: Colors.blue)
          ],
        ),
      ),
    );
  }
}

import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/appointment/presentation/viewModel/getAllAppointment/getallappointment_cubit.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/appointmentBody.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/appointmentDateTime.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/bookingInformation.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/paymentOptions.dart';
import 'package:docdoc/Features/home/presentation/viewModel/changeoppointment/changeoppointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';

class PageView0 extends StatelessWidget {
  const PageView0({
    super.key,
    required this.doctor,
    required this.review,
    required this.doctorImage,
  });

  final GetDoctors doctor;
  final String review;
  final String doctorImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About me',
          style: AppFonts.f18w700,
        ),
        const SizedBox(height: 5),
        Text(
          'Dr. ${doctor.name} is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.',
          style: AppFonts.f14w400,
        ),
        const SizedBox(height: 5),
        Text(
          'Degree',
          style: AppFonts.f18w700,
        ),
        const SizedBox(height: 5),
        Text(
          doctor.degree,
          style: AppFonts.f14w400,
        ),
        const SizedBox(height: 5),
        Text(
          'Discription',
          style: AppFonts.f18w700,
        ),
        const SizedBox(height: 5),
        Text(
          doctor.description,
          style: AppFonts.f14w400,
        ),
        const SizedBox(height: 5),
        Text(
          'Working Time',
          style: AppFonts.f18w700,
        ),
        const SizedBox(height: 5),
        Text(
          'Monday - Friday, ${doctor.start_time} - ${doctor.end_time}',
          style: AppFonts.f14w400,
        ),
        const SizedBox(height: 5),
        Text(
          'Specialization',
          style: AppFonts.f18w700,
        ),
        const SizedBox(height: 5),
        Text(
          doctor.specialization.name,
          style: AppFonts.f14w400,
        ),
        const SizedBox(height: 5),
        Text(
          'Location',
          style: AppFonts.f18w700,
        ),
        const SizedBox(height: 5),
        Text(
          'Government | ${doctor.city.governrate.name} City | ${doctor.city.name}',
          style: AppFonts.f14w400,
        ),
        const SizedBox(height: 5),
        Text(
          'Address',
          style: AppFonts.f18w700,
        ),
        const SizedBox(height: 5),
        Text(
          doctor.address,
          style: AppFonts.f14w400,
        ),
        const Spacer(),
        Center(
          child: Customelinearbutton(
              onTap: () {
                Get.bottomSheet(
                    isScrollControlled: true,
                    MultiBlocProvider(
                      providers: [
                        BlocProvider<ChangeoppointmentCubit>(
                            create: (context) => ChangeoppointmentCubit()),
                        BlocProvider<GetallappointmentCubit>(
                            create: (context) => GetallappointmentCubit())
                      ],
                      child: MackAppointmentBody(
                        doctor: doctor,
                        doctorImage: doctorImage,
                        review: review,
                      ),
                    ));
              },
              child: Text(
                'Make An Appointment',
                style: AppFonts.f18w600,
              ),
              width: Get.size.width,
              height: 45.h,
              color: Colors.blue),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}

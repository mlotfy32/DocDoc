import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/appointment/presentation/view/widgets/pageCompleted.dart';
import 'package:docdoc/Features/appointment/presentation/view/widgets/pageUpcoming.dart';
import 'package:docdoc/Features/appointment/presentation/viewModel/changeappointmentpageview/changeappointmentpageview_cubit.dart';
import 'package:docdoc/Features/appointment/presentation/viewModel/getAllAppointment/getallappointment_cubit.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/messageDoctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Appointmentpageview extends StatefulWidget {
  const Appointmentpageview({super.key});

  @override
  State<Appointmentpageview> createState() => _AppointmentpageviewState();
}

class _AppointmentpageviewState extends State<Appointmentpageview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height - 174.h,
      child: PageView.builder(
          onPageChanged: (value) {
            BlocProvider.of<ChangeappointmentpageviewCubit>(context)
                .changeApointPageView(index: value);
          },
          itemCount: 3,
          itemBuilder: (context, index) => index == 0
              ? BlocProvider<GetallappointmentCubit>(
                  create: (context) => GetallappointmentCubit(),
                  child: const Pageupcoming(
                    isAppoint: false,
                  ))
              : index == 1
                  ? const PageComplete(
                      canceld: false,
                    )
                  : const PageComplete(
                      canceld: true,
                    )),
    );
  }
}

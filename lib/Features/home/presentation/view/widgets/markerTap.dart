import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/doctorDetailes.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getdoctor/getdoctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MarkerTap extends StatefulWidget {
  const MarkerTap({super.key, required this.id});
  final int id;

  @override
  State<MarkerTap> createState() => _MarkerTapState();
}

class _MarkerTapState extends State<MarkerTap> {
  @override
  void initState() {
    BlocProvider.of<GetdoctorCubit>(context).GetDocror(id: 60 - widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetdoctorCubit, GetdoctorState>(
      builder: (context, state) {
        if (state is GetdoctorFailure) {
          return Center(child: Text('Error', style: AppFonts.f20w700));
        } else if (state is GetdoctorSuccess) {
          return InkWell(
            onTap: () {
              Get.to(() => Doctordetailes(
                  doctor: state.doctor,
                  doctorImage: AppImages.recommentedDoctors[60 - widget.id],
                  review:
                      ' ${Sendotp.otp.generateRandomNumber(1)}.${Sendotp.otp.generateRandomNumber(1)} (${Sendotp.otp.generateRandomNumber(1)}.${Sendotp.otp.generateRandomNumber(3)} reviews)'));
            },
            child: Container(
                width: Get.size.width,
                height: 80.h,
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      width: 140.w,
                      height: 80.h,
                      AppImages.recommentedDoctors[60 - widget.id],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  SizedBox(
                      height: 150,
                      width: Get.size.width - 217,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              overflow: TextOverflow.ellipsis,
                              'Dr.${state.doctor.name}',
                              style: AppFonts.f18w600
                                  .copyWith(color: const Color(0xff242424)),
                            ),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              'General | ${state.doctor.description}',
                              style: AppFonts.f18w600
                                  .copyWith(color: const Color(0xff242424)),
                            ),
                          ]))
                ])),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

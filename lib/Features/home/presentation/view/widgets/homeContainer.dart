import 'dart:developer';

import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.1%20animate_do.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/home/data/location/googleMapsServices.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/findNearBy.dart';
import 'package:docdoc/Features/home/presentation/viewModel/change_map/change_map_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getdoctor/getdoctor_cubit.dart';
import 'package:docdoc/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Homecontainer extends StatelessWidget {
  const Homecontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height / 3.4,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            width: Get.size.width,
            height: Get.size.height / 3.5.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.size.width / 3.1,
                  child: Text(
                    textAlign: TextAlign.start,
                    LangKeys.bookAndSca.tr,
                    style: AppFonts.f18w600,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.blue),
          ),
          Positioned(
            top: 50,
            left: -50,
            child: Transform(
              transform: Matrix4.skewX(-0.8),
              child: Container(
                width: Get.size.width,
                height: Get.size.height / 3.5.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0.0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: language == 'en' || language == null ? 200.w : 0,
            right: language == 'ar' ? 200.w : 0,
            bottom: 5.h,
            child: CustomFadeInRight(
              duration: 1000,
              child: Image.asset(
                fit: BoxFit.fill,
                AppImages.homeDoctor,
                height: 250.h,
                width: 160,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 150.h),
            child: Customelinearbutton(
                onTap: () async {
                  Get.to(
                      () => MultiBlocProvider(providers: [
                            BlocProvider<ChangeMapCubit>(
                                create: (context) => ChangeMapCubit()),
                            BlocProvider<GetdoctorCubit>(
                                create: (context) => GetdoctorCubit())
                          ], child: const Findnearby()),
                      curve: Appcurves.curves);
                },
                child: Text(
                  textAlign: TextAlign.center,
                  LangKeys.findNear.tr,
                  style: AppFonts.f12w400,
                ),
                width: 100,
                height: 40,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}

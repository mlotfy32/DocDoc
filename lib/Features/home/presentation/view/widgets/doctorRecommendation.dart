import 'dart:developer';

import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/loading/1.2%20loading_shimmer.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/allDoctorsViewBody.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/doctorDetailes.dart';
import 'package:docdoc/Features/home/presentation/viewModel/changepageview/changepageview_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getalldoctors/getalldoctors_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getallspeclization/getallspeclization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Doctorrecommendation extends StatefulWidget {
  const Doctorrecommendation({super.key});

  @override
  State<Doctorrecommendation> createState() => _DoctorrecommendationState();
}

class _DoctorrecommendationState extends State<Doctorrecommendation> {
  @override
  void initState() {
    BlocProvider.of<GetalldoctorsCubit>(context).GetDoctors();
    super.initState();
  }

  String review =
      ' ${Sendotp.otp.generateRandomNumber(1)}.${Sendotp.otp.generateRandomNumber(1)} (${Sendotp.otp.generateRandomNumber(1)}.${Sendotp.otp.generateRandomNumber(3)} reviews)';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LangKeys.recDoctor.tr,
                style: AppFonts.f20w700,
              ),
              BlocBuilder<GetalldoctorsCubit, GetalldoctorsState>(
                builder: (context, state) {
                  if (state is GetalldoctorsSuccess) {
                    return TextButton(
                        onPressed: () {
                          Get.to(
                              () => Alldoctorsviewbody(doctors: state.doctors));
                        },
                        child: Text(
                          LangKeys.seeAll.tr,
                          style: AppFonts.f12w400,
                        ));
                  }
                  return TextButton(
                      onPressed: () {
                        Helper.FlutterToast(
                            title: LangKeys.noDocFound.tr, success: false);
                      },
                      child: Text(
                        LangKeys.seeAll.tr,
                        style: AppFonts.f12w400,
                      ));
                },
              )
            ],
          ),
          BlocBuilder<GetalldoctorsCubit, GetalldoctorsState>(
            builder: (context, state) {
              if (state is GetalldoctorsSuccess) {
                return SizedBox(
                  height: Get.size.height - 500.h,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () =>
                                Get.to(() => BlocProvider<ChangepageviewCubit>(
                                      create: (context) =>
                                          ChangepageviewCubit(),
                                      child: Doctordetailes(
                                        review: review,
                                        doctor: state.doctors[index],
                                        doctorImage:
                                            AppImages.recommentedDoctors[index],
                                      ),
                                    )),
                            child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                alignment: Alignment.topLeft,
                                child: Row(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      width: 160.w,
                                      height: 130.h,
                                      AppImages.recommentedDoctors[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  SizedBox(
                                    width: Get.size.width - 175,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          'Dr.${state.doctors[index].name}',
                                          style: AppFonts.f18w600.copyWith(
                                              color: const Color(0xff242424)),
                                        ),
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          'General | ${state.doctors[index].description}',
                                          style: AppFonts.f18w600.copyWith(
                                              color: const Color(0xff242424)),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.star,
                                                color: Colors.amber),
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              review,
                                              style: AppFonts.f13w400.copyWith(
                                                  color:
                                                      const Color(0xff242424)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ])),
                          )),
                );
              } else if (state is GetallspeclizationFailure) {
                return Container(
                    alignment: Alignment.center,
                    child: LoadingShimmer(
                      width: 160.w,
                      height: 130.h,
                    ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)));
              } else {
                return SizedBox(
                  height: Get.size.height - 440.h,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 5.h),
                          alignment: Alignment.topLeft,
                          child: Row(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: LoadingShimmer(
                                  width: 160.w,
                                  height: 130.h,
                                )),
                            SizedBox(width: 5.w),
                            SizedBox(
                              width: Get.size.width - 183,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LoadingShimmer(
                                    width: double.infinity,
                                    height: 15.h,
                                  ),
                                  LoadingShimmer(
                                    width: double.infinity,
                                    height: 15.h,
                                  ),
                                  LoadingShimmer(
                                    width: double.infinity,
                                    height: 15.h,
                                  ),
                                ],
                              ),
                            )
                          ]))),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

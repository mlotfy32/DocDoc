import 'dart:developer';
import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/loading/1.2%20loading_shimmer.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/getDoctorsSpec.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/seeAllSpecialitysBody.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getallspeclization/getallspeclization_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getdoctorsspeci/getdoctorsspeci_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Doctorspeciality extends StatefulWidget {
  const Doctorspeciality({super.key});

  @override
  State<Doctorspeciality> createState() => _DoctorspecialityState();
}

class _DoctorspecialityState extends State<Doctorspeciality> {
  @override
  void initState() {
    BlocProvider.of<GetallspeclizationCubit>(context).Getallspeclization();
    super.initState();
  }

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
                LangKeys.doctorSpe.tr,
                style:
                    AppFonts.f18w600.copyWith(color: const Color(0xff242424)),
              ),
              BlocBuilder<GetallspeclizationCubit, GetallspeclizationState>(
                builder: (context, state) {
                  if (state is GetallspeclizationSuccess) {
                    return TextButton(
                        onPressed: () {
                          Get.to(() => Seeallspecialitysbody(data: state.data));
                        },
                        child: Text(
                          LangKeys.seeAll.tr,
                          style: AppFonts.f12w400,
                        ));
                  }
                  return TextButton(
                      onPressed: () {
                        Helper.FlutterToast(
                            title: LangKeys.noSpi.tr, success: false);
                      },
                      child: Text(
                        LangKeys.seeAll.tr,
                        style: AppFonts.f12w400,
                      ));
                },
              )
            ],
          ),
          BlocBuilder<GetallspeclizationCubit, GetallspeclizationState>(
            builder: (context, state) {
              log('Rebuilding GetallspeclizationCubit');

              if (state is GetallspeclizationSuccess) {
                return Container(
                    height: 80,
                    width: Get.size.width,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                  () => BlocProvider<GetdoctorsspeciCubit>(
                                        create: (context) =>
                                            GetdoctorsspeciCubit(),
                                        child: Getdoctorsspec(
                                          id: state.data[index].id,
                                          speci: state.data[index].name,
                                        ),
                                      ),
                                  curve: Appcurves.curves);
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      AppImages.specialityImages[index]),
                                ),
                                Text(state.data[index].name)
                              ],
                            ),
                          )),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ));
              } else if (state is GetallspeclizationFailure) {
                return Center(
                    child: Text(state.error, style: AppFonts.f18w600));
              } else
                return SizedBox(
                    height: 80,
                    width: Get.size.width,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        width: 73.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: const LoadingShimmer(),
                      ),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ));
            },
          )
        ],
      ),
    );
  }
}

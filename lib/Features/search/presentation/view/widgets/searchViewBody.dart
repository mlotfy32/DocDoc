import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/constans.dart';
import 'package:docdoc/Core/Utiles/loading/1.2%20loading_shimmer.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:docdoc/Features/search/data/local/hiveSearch.dart';
import 'package:docdoc/Features/search/presentation/view/widgets/doctorSearchForm.dart';
import 'package:docdoc/Features/search/presentation/view/widgets/historyView.dart';
import 'package:docdoc/Features/search/presentation/viewModel/gethistory/gethistory_cubit.dart';
import 'package:docdoc/Features/search/presentation/viewModel/searchdoctor/searchdoctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class Searchviewbody extends StatelessWidget {
  Searchviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Text(
            'Search',
            textAlign: TextAlign.center,
            style: AppFonts.f20w700,
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
          const SliverToBoxAdapter(child: Doctorsearchform()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: Get.size.height - 175.h,
              child: BlocBuilder<SearchdoctorCubit, SearchdoctorState>(
                builder: (context, state) {
                  if (state is SearchdoctorSuccess &&
                      state.doctors.isNotEmpty) {
                    return SizedBox(
                      height: Get.size.height - 440.h,
                      child: ListView.builder(
                          itemCount: state.doctors.length,
                          itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  index == 0
                                      ? Text(
                                          '${state.doctors.length} Result Found',
                                          style: AppFonts.f20w700,
                                        )
                                      : const SizedBox.shrink(),
                                  Row(children: [
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
                                                ' ${Sendotp.otp.generateRandomNumber(1)}.${Sendotp.otp.generateRandomNumber(1)} (${Sendotp.otp.generateRandomNumber(1)}.${Sendotp.otp.generateRandomNumber(3)} reviews)',
                                                style: AppFonts.f13w400
                                                    .copyWith(
                                                        color: const Color(
                                                            0xff242424)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ],
                              ))),
                    );
                  } else if (state is SearchdoctorFailure ||
                      state is SearchdoctorSuccess && state.doctors.isEmpty) {
                    return Center(
                      child: Text(
                        'No Doctors Found',
                        style: AppFonts.f20w700,
                      ),
                    );
                  } else if (state is SearchdoctorLoading) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                  } else {
                    return BlocProvider<GethistoryCubit>(
                      create: (context) => GethistoryCubit(),
                      child: const historyView(),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/getDoctorsSpec.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getdoctorsspeci/getdoctorsspeci_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Seeallspecialitysbody extends StatelessWidget {
  const Seeallspecialitysbody({super.key, required this.data});
  final List<Getspeclizationres> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 30,
                      )),
                ),
                SizedBox(width: 60.w),
                Text(
                  'Doctor Speciality',
                  style: AppFonts.f20w700,
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 5.h,
          )),
          SliverToBoxAdapter(
              child: Container(
                  child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              childAspectRatio: 130 / 120,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                  splashColor: const Color(0xffFFF4F8FF),
                  onTap: () {
                    Get.to(
                        () => BlocProvider<GetdoctorsspeciCubit>(
                              create: (context) => GetdoctorsspeciCubit(),
                              child: Getdoctorsspec(
                                id: data[index].id,
                                speci: data[index].name,
                              ),
                            ),
                        curve: Appcurves.curves);
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundColor:
                            const Color.fromARGB(255, 196, 224, 247),
                        child: CircleAvatar(
                          radius: 43.r,
                          backgroundImage:
                              AssetImage(AppImages.specialityImages[index]),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(data[index].name, style: AppFonts.f18w500)
                    ],
                  ));
            },
          )))
        ]),
      ),
    );
  }
}

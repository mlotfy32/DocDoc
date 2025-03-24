import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/home/presentation/viewModel/cahngedatetime/cahngedatetime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TimeGrid extends StatelessWidget {
  const TimeGrid({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> times = [
      '08 : 00 pm',
      '08 : 30 pm',
      '9 : 30 pm',
      '10 : 00 pm',
      '10 : 30 pm',
      '11 :30 pm'
    ];
    int initialIndex = 3;
    return SizedBox(
      width: Get.size.width,
      height: 200.h,
      child: BlocBuilder<CahngedatetimeCubit, CahngedatetimeState>(
        builder: (context, state) {
          initialIndex = state is CahngeDate ? state.index : initialIndex;

          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 60.h, crossAxisSpacing: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => BlocProvider.of<CahngedatetimeCubit>(context)
                      .changeDateTime(isTime: false, index: index),
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index == initialIndex
                              ? Colors.blue
                              : Colors.grey),
                      child: Text(
                        times[index],
                        style: AppFonts.f18w600,
                      )),
                );
              });
        },
      ),
    );
  }
}

import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/home/presentation/viewModel/cahngedatetime/cahngedatetime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Cursor extends StatelessWidget {
  Cursor({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> days = ['Mon', 'Teu', 'Wed', 'Thu', 'Fri'];
    final List<String> num = ['06', '07', '08', '09', '10'];
    int selectedIndex = 4;
    return Row(children: [
      const Icon(Icons.arrow_back_ios_new_rounded),
      SizedBox(
        width: Get.size.width - 59,
        height: 70,
        child: BlocBuilder<CahngedatetimeCubit, CahngedatetimeState>(
          builder: (context, state) {
            selectedIndex = state is CahngeDate ? state.index : selectedIndex;
            {
              return ListView.builder(
                  itemCount: days.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () =>
                            BlocProvider.of<CahngedatetimeCubit>(context)
                                .changeDateTime(isTime: false, index: index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 700),
                          width: 56.w,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              color: index == selectedIndex
                                  ? Colors.blue
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(15)),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${days[index]}', style: AppFonts.f18w600),
                              Text('${num[index]}', style: AppFonts.f18w600)
                            ],
                          ),
                        ),
                      ));
            }
          },
        ),
      ),
      const Icon(Icons.arrow_forward_ios),
    ]);
  }
}

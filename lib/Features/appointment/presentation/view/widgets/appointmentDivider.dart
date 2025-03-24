import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/appointment/presentation/viewModel/changeappointmentpageview/changeappointmentpageview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointmentdivider extends StatelessWidget {
  const Appointmentdivider({super.key});

  @override
  Widget build(BuildContext context) {
    int initialIndex = 0;

    return SizedBox(
      height: 32,
      child: BlocBuilder<ChangeappointmentpageviewCubit,
          ChangeappointmentpageviewState>(
        builder: (context, state) {
          initialIndex =
              state is Changeappointmentpageview ? state.index : initialIndex;
          return SizedBox(
            height: 29.h,
            width: 300,
            child: SizedBox(
                height: 29.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      BlocProvider.of<ChangeappointmentpageviewCubit>(context)
                          .changeApointPageView(index: index);
                    },
                    child: SizedBox(
                        height: 59.h,
                        width: 100,
                        child: Column(
                          children: [
                            Text(
                              '   ${taps[index]}',
                              style: AppFonts.f16w600.copyWith(
                                  color: index == initialIndex
                                      ? Colors.blue
                                      : const Color(0xff9E9E9E)),
                            ),
                            index == initialIndex
                                ? const Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: const SizedBox(
                                      width: 80,
                                      child: Divider(
                                        height: 9,
                                        thickness: 2,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        )),
                  ),
                )),
          );
        },
      ),
    );
  }
}

List<String> taps = ['Upcoming', 'Completed', 'Cancelled'];

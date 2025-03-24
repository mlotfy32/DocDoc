import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/pageView0.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/pageView1.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/reviews.dart';
import 'package:docdoc/Features/home/presentation/viewModel/changeoppointment/changeoppointment_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/changepageview/changepageview_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/changepageviewcontent/changepageviewcontent_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

List<String> taps = ['About', 'Location', 'Reviews'];

class PageViewBody extends StatelessWidget {
  const PageViewBody(
      {super.key,
      required this.doctor,
      required this.review,
      required this.doctorImage});
  final GetDoctors doctor;
  final String review;
  final String doctorImage;
  @override
  Widget build(BuildContext context) {
    int initialIndex = 0;
    return SizedBox(
      height: Get.size.height - 129.h,
      width: 300,
      child: Column(children: [
        BlocBuilder<ChangepageviewCubit, ChangepageviewState>(
          builder: (context, state) {
            initialIndex = state is Changepageview ? state.index : initialIndex;
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
                        BlocProvider.of<ChangepageviewCubit>(context)
                            .changePageView(index: index);
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
        SizedBox(
          height: Get.size.height - 180,
          child: PageView.builder(
              onPageChanged: (value) {
                BlocProvider.of<ChangepageviewCubit>(context)
                    .changePageView(index: value);
              },
              itemCount: 3,
              itemBuilder: (context, index) => index == 0
                  ? BlocProvider<ChangeoppointmentCubit>(
                      create: (context) => ChangeoppointmentCubit(),
                      child: PageView0(
                        doctor: doctor,
                        doctorImage: doctorImage,
                        review: review,
                      ),
                    )
                  : index == 2
                      ? Reviews(
                          doctorName: doctor.name,
                        )
                      : BlocProvider.value(
                          value: ChangepageviewcontentCubit(),
                          child: Pageview1(
                            doctor: doctor,
                          ),
                        )),
        ),
      ]),
    );
  }
}

import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Features/home/presentation/viewModel/change_tab/change_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class homeBottomNavBar extends StatelessWidget {
  const homeBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int initialIndex = 0;
    var userImage = SharedPref().getString(PrefsKeys.userImage);

    return BlocBuilder<ChangeTabCubit, ChangeTabState>(
      builder: (context, state) {
        initialIndex = state is ChangeTab ? state.tab : initialIndex;
        return Container(
          width: Get.size.width,
          height: 60.h,
          color: Colors.white,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: index == 4
                  ? InkWell(
                      onTap: () => BlocProvider.of<ChangeTabCubit>(context)
                          .changeTab(Tap: index),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profile),
                      ),
                    )
                  : index == initialIndex
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue),
                          margin: EdgeInsets.only(bottom: 20.h, top: 3.h),
                          child: IconButton(
                              onPressed: () {
                                BlocProvider.of<ChangeTabCubit>(context)
                                    .changeTab(Tap: index);
                              },
                              icon: SvgPicture.asset(
                                AppImages.homeTabs[index],
                                color: Colors.white,
                                // color: Colors.blueGrey,
                              )),
                        ).animate().fade().scale()
                      : IconButton(
                          onPressed: () {
                            BlocProvider.of<ChangeTabCubit>(context)
                                .changeTab(Tap: index);
                          },
                          icon: SvgPicture.asset(
                            AppImages.homeTabs[index],
                            // color: Colors.blueGrey,
                          )),
            ),
          ),
        );
      },
    );
  }
}

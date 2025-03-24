import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Features/appointment/presentation/view/appointmentView.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/bottomNavBar.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/customeHomeAppBar.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/doctorRecommendation.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/doctorSpeciality.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/homeContainer.dart';
import 'package:docdoc/Features/home/presentation/viewModel/change_tab/change_tab_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getalldoctors/getalldoctors_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getallspeclization/getallspeclization_cubit.dart';
import 'package:docdoc/Features/messages/presentation/view/messagesView.dart';
import 'package:docdoc/Features/messages/presentation/view/widgets/messagesViewBody.dart';
import 'package:docdoc/Features/profile/presentation/view/profileView.dart';
import 'package:docdoc/Features/search/presentation/view/searchView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Homeviewbody extends StatelessWidget {
  const Homeviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ChangeTabCubit, ChangeTabState>(
          builder: (context, state) {
            if (state is ChangeTab && state.tab == 1) {
              return const Messagesview();
            } else if (state is ChangeTab && state.tab == 2) {
              return const Searchview();
            } else if (state is ChangeTab && state.tab == 3) {
              return const Appointmentview();
            } else if (state is ChangeTab && state.tab == 4) {
              return const Profileview();
            } else
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 7.h),
                    ),
                    const SliverToBoxAdapter(
                      child: Customehomeappbar(),
                    ),
                    const SliverToBoxAdapter(
                      child: Homecontainer(),
                    ),
                    SliverToBoxAdapter(
                        child: BlocProvider<GetallspeclizationCubit>(
                      create: (context) => GetallspeclizationCubit(),
                      child: const Doctorspeciality(),
                    )),
                    SliverToBoxAdapter(
                      child: BlocProvider<GetalldoctorsCubit>(
                        create: (context) => GetalldoctorsCubit(),
                        child: const Doctorrecommendation(),
                      ),
                    ),
                  ],
                ),
              );
          },
        ),
      ),
      bottomNavigationBar: const homeBottomNavBar(),
    );
  }
}

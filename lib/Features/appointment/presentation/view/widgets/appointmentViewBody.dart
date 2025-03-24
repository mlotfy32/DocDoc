import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/appointment/presentation/view/widgets/appointmentDivider.dart';
import 'package:docdoc/Features/appointment/presentation/view/widgets/appointmentPageView.dart';
import 'package:docdoc/Features/appointment/presentation/viewModel/changeappointmentpageview/changeappointmentpageview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Appointmentviewbody extends StatelessWidget {
  const Appointmentviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Expanded(
                  child: Text(
                overflow: TextOverflow.ellipsis,
                'My Appointment',
                style: AppFonts.f20w700,
              )),
              actions: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(15)),
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.search,
                    size: 27,
                  ),
                ),
              ],
            ),
            const SliverToBoxAdapter(child: Appointmentdivider()),
            const SliverToBoxAdapter(child: Appointmentpageview()),
          ],
        ),
      ),
    );
  }
}

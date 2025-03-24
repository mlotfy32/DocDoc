import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/allDoctorsViewBody.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/messageDoctor.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/pageView0.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/pageView1.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/pageViewBody.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/reviews.dart';
import 'package:docdoc/Features/home/presentation/viewModel/changeoppointment/changeoppointment_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/changepageview/changepageview_cubit.dart';
import 'package:docdoc/Features/home/presentation/viewModel/changepageviewcontent/changepageviewcontent_cubit.dart';
import 'package:docdoc/Features/messages/presentation/view/messagesView.dart';
import 'package:docdoc/Features/messages/presentation/view/widgets/sendMessages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Doctordetailes extends StatefulWidget {
  const Doctordetailes(
      {super.key,
      required this.doctor,
      required this.doctorImage,
      required this.review});
  final GetDoctors doctor;
  final String doctorImage;
  final String review;

  @override
  State<Doctordetailes> createState() => _DoctordetailesState();
}

class _DoctordetailesState extends State<Doctordetailes> {
  @override
  Widget build(BuildContext context) {
    int initialIndex = 0;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
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
                centerTitle: true,
                title: Expanded(
                    child: Text(
                  overflow: TextOverflow.ellipsis,
                  widget.doctor.name,
                  style: AppFonts.f20w700,
                )),
                actions: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        onPressed: () {
                          Get.to(
                              () => Sendmessages(
                                    description: widget.doctor.description,
                                    name: widget.doctor.name,
                                    doctorPic: widget.doctorImage,
                                  ),
                              curve: Appcurves.curves);
                        },
                        icon: SvgPicture.asset(
                          AppImages.contact,
                          fit: BoxFit.fill,
                          // color: Colors.blueAccent,
                        )),
                  ),
                ],
              ),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 10,
              )),
              SliverToBoxAdapter(
                child: MessageDoctor(
                  doctor: widget.doctor,
                  doctorImage: widget.doctorImage,
                  review: widget.review,
                ),
              ),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 10,
              )),
              SliverToBoxAdapter(
                child: BlocProvider<ChangepageviewCubit>(
                  create: (context) => ChangepageviewCubit(),
                  child: BlocProvider<ChangepageviewcontentCubit>(
                    create: (context) => ChangepageviewcontentCubit(),
                    child: PageViewBody(
                        doctor: widget.doctor,
                        doctorImage: widget.doctorImage,
                        review: widget.review),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

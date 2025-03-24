import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/loading/1.2%20loading_shimmer.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/doctorDetailes.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/getDoctorSpiLoading.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/getDoctorSpiSuccess.dart';
import 'package:docdoc/Features/home/presentation/viewModel/getdoctorsspeci/getdoctorsspeci_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Getdoctorsspec extends StatefulWidget {
  const Getdoctorsspec({super.key, required this.id, required this.speci});
  final int id;
  final String speci;

  @override
  State<Getdoctorsspec> createState() => _GetdoctorsspecState();
}

class _GetdoctorsspecState extends State<Getdoctorsspec> {
  @override
  void initState() {
    BlocProvider.of<GetdoctorsspeciCubit>(context)
        .getDoctorsSpeclization(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  backgroundColor: Colors.white,
                  leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                  title: Text(
                    widget.speci,
                    style: AppFonts.f20w700,
                  ),
                  centerTitle: true),
              SliverToBoxAdapter(child:
                  BlocBuilder<GetdoctorsspeciCubit, GetdoctorsspeciState>(
                builder: (context, state) {
                  if (state is GetdoctorsspecSuccess) {
                    return getDoctorsSpeciSucc(
                        doctors: state.doctors, id: widget.id);
                  } else if (state is GetdoctorsspeciFailure) {
                    return Center(
                        child: Text(state.error, style: AppFonts.f18w700));
                  } else {
                    return const Center(child: GetDoctorSpiLoading());
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

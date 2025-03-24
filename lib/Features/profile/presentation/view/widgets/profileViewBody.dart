import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCubites/changelang/changelang_cubit.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/image_Picker.dart';
import 'package:docdoc/Core/Utiles/loading/1.2%20loading_shimmer.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Core/customeWepView.dart';
import 'package:docdoc/Features/appointment/presentation/view/widgets/pageUpcoming.dart';
import 'package:docdoc/Features/appointment/presentation/viewModel/getAllAppointment/getallappointment_cubit.dart';
import 'package:docdoc/Features/auth/signUp/presentation/viewModel/signup/signup_cubit.dart';
import 'package:docdoc/Features/profile/presentation/view/widgets/payment.dart';
import 'package:docdoc/Features/profile/presentation/view/widgets/settings.dart';
import 'package:docdoc/Features/profile/presentation/view/widgets/userInformation.dart';
import 'package:docdoc/Features/profile/presentation/viewModel/getuserdata/getuserdata_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:docdoc/Core/Utiles/env_variables.dart';

class Profileviewbody extends StatefulWidget {
  const Profileviewbody({super.key});

  @override
  State<Profileviewbody> createState() => _ProfileviewbodyState();
}

class _ProfileviewbodyState extends State<Profileviewbody> {
  @override
  void initState() {
    BlocProvider.of<GetuserdataCubit>(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: Get.size.height - 104.h,
            color: Colors.blue,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.size.width / 2 - 20,
                ),
                Text(
                  'Profile',
                  style: AppFonts.f19w500.copyWith(color: Colors.white),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Get.to(() => const Settings(), curve: Appcurves.curves);
                    },
                    icon: const Icon(
                      size: 28,
                      Icons.settings,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 150.h),
            width: Get.size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white),
            child: BlocBuilder<GetuserdataCubit, GetuserdataState>(
              builder: (context, state) {
                if (state is GetuserdataSuccess) {
                  return Column(children: [
                    const SizedBox(height: 65),
                    Text('Mhmd Lotfy', style: AppFonts.f18w700),
                    const SizedBox(height: 5),
                    Text(state.userEmail, style: AppFonts.f14w400),
                    const SizedBox(height: 10),
                    Container(
                      width: Get.size.width / 1.1,
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffF8F8F8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.to(
                                    () => BlocProvider<GetallappointmentCubit>(
                                        create: (context) =>
                                            GetallappointmentCubit(),
                                        child: const Pageupcoming(
                                          isAppoint: true,
                                        )),
                                    curve: Appcurves.curves);
                              },
                              child: Text('My Appointment',
                                  style: AppFonts.f16w600
                                      .copyWith(color: Colors.black))),
                          const Text(
                            '|',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w200),
                            textScaleFactor: 3,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => Customewebview(
                                    url: '${EnvVariable.instance.gitHup}'));
                              },
                              child: Text('About Us',
                                  style: AppFonts.f16w600
                                      .copyWith(color: Colors.black)))
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 250.h,
                      child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      index == 0
                                          ? BlocProvider<SignupCubit>(
                                              create: (context) =>
                                                  SignupCubit(),
                                              child: UserInformation(
                                                email: state.userEmail,
                                                name: state.userName,
                                                phone: state.userPhone,
                                                userImage: state.userImage,
                                              ),
                                            )
                                          : Container(
                                              color: Colors.black,
                                              padding: const EdgeInsets.only(
                                                  top: 80),
                                              width: Get.size.width,
                                              height: Get.size.height,
                                              child: Payment()));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: index == 0
                                            ? const Color(0xffFFEAF2FF)
                                            : const Color(0xffFFFFEEEF),
                                        child: SvgPicture.asset(
                                            width: 50,
                                            fit: BoxFit.scaleDown,
                                            height: 30,
                                            AppImages.profileIcons[index]),
                                      ),
                                      const SizedBox(width: 20),
                                      Text(
                                        personal[index],
                                        style: AppFonts.f18w500.copyWith(
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(),
                              ),
                          itemCount: personal.length),
                    )
                  ]);
                } else if (state is GetuserdataFailure) {
                  return Center(
                      child: Text(state.errorMessage, style: AppFonts.f18w700));
                }
                return const Column(children: [
                  const SizedBox(height: 65),
                  LoadingShimmer(width: 100, height: 40),
                  SizedBox(height: 5),
                  LoadingShimmer(width: 120, height: 40),
                ]);
              },
            ),
          ),
          Positioned(
            left: Get.size.width / 2 - 50,
            top: Get.size.height / 6,
            child: InkWell(
              onTap: () {},
              child: AvatarGlow(
                glowColor: Colors.lightBlueAccent,
                glowRadiusFactor: 0.25,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage(AppImages.profile)),
                  radius: 50.0,
                ),
              ),
            ),
          ),
          Positioned(
              left: Get.size.width / 2 + 25,
              top: Get.size.height / 4.3,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: const Color(0xffFFF8F8F8),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.edit,
                        size: 18, color: Colors.blue)),
              )),
        ],
      ),
    );
  }
}

List<String> personal = ['Personal Information', 'Payment'];

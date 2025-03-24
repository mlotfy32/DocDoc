import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/auth/login/Presentation/view/loginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Onbordingviewbody extends StatelessWidget {
  const Onbordingviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Container(
            child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              width: Get.size.width,
              height: Get.size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.1,
                  image: AssetImage(AppImages.onBordinBackLogo),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(
                children: [
                  SvgPicture.asset(AppImages.onBordinDocdoc),
                  SizedBox(
                    height: Get.size.height / 8.h,
                  ),
                  Image.asset(AppImages.onBordingDoctor)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 400.h),
              width: Get.size.width,
              // color: Colors.amber,
              child: SvgPicture.asset(
                AppImages.onBordingLinearEffect,
                width: Get.size.width,
                height: 120.h,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 400.h),
              child: Column(
                children: [
                  Text(
                    LangKeys.bestDoc.tr,
                    style: AppFonts.f32w700,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    LangKeys.manageAndSch.tr,
                    style: AppFonts.f12w400.copyWith(color: Color(0xff757575)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Customelinearbutton(
                      onTap: () {
                        Get.off(
                          () => const Loginview(),
                          curve: Appcurves.curves,
                        );
                      },
                      child: Text(
                        LangKeys.getStart.tr,
                        style: AppFonts.f24w700.copyWith(color: Colors.white),
                      ),
                      width: Get.size.width,
                      height: 50.h,
                      color: const Color(0xff247CFF))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

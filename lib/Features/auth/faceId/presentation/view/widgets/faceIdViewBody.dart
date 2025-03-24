import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/auth/faceId/presentation/data/faceIdLogic.dart';
import 'package:docdoc/Features/home/presentation/view/homeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Faceidviewbody extends StatefulWidget {
  const Faceidviewbody({super.key});

  @override
  State<Faceidviewbody> createState() => _FaceidviewbodyState();
}

class _FaceidviewbodyState extends State<Faceidviewbody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              'Face ID',
              style: AppFonts.f24w700,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Add a Face ID Or Fingerprint to make your account more secure and easy to sign in.',
              style: AppFonts.f14w400,
            ),
            SizedBox(
              height: 100.h,
            ),
            Center(child: Image.asset(AppImages.faceId)),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Get.offAll(() => const Homeview(), curve: Appcurves.curves);
                },
                child: Text('Skip',
                    style: AppFonts.f16w600
                        .copyWith(color: const Color(0xff247CFF)))),
            Customelinearbutton(
                onTap: () async {
                  Faceidlogic(context).authenticate();
                },
                child: Text(
                  'Add Face ID Or Fingerprint',
                  style: AppFonts.f16w600.copyWith(color: Colors.white),
                ),
                width: Get.size.width,
                height: 50.h,
                color: const Color(0xff247CFF))
          ],
        ),
      ),
    );
  }
}

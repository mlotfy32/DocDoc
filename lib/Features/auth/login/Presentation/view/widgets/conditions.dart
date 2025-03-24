import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/auth/signUp/presentation/view/signUpView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Conditions extends StatelessWidget {
  const Conditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: LangKeys.byLoginng.tr,
                style: AppFonts.f11w400,
              ),
              const TextSpan(
                text: '  ',
              ),
              TextSpan(text: LangKeys.termsAndCon.tr, style: AppFonts.f13w400),
              TextSpan(
                text: LangKeys.and.tr,
                style: AppFonts.f11w400,
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                  text: LangKeys.privacyPolice.tr, style: AppFonts.f13w400),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LangKeys.dontHavAcc.tr, style: AppFonts.f13w400),
            TextButton(
                onPressed: () {
                  Get.offAll(
                    () => const Signupview(),
                    curve: Appcurves.curves,
                  );
                },
                child: Text(LangKeys.signUp.tr,
                    style: AppFonts.f13w400
                        .copyWith(color: const Color(0xff247CFF))))
          ],
        )
      ],
    );
  }
}

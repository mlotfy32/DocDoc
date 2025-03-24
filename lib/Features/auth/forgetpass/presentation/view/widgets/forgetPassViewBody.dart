import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:docdoc/Features/auth/forgetpass/presentation/view/widgets/otpVerification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Forgetpassviewbody extends StatefulWidget {
  const Forgetpassviewbody({super.key});

  @override
  State<Forgetpassviewbody> createState() => _ForgetpassviewbodyState();
}

class _ForgetpassviewbodyState extends State<Forgetpassviewbody> {
  TextEditingController email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
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
              LangKeys.forgotPass.tr,
              style: AppFonts.f24w700,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              LangKeys.atOurApp.tr,
              style: AppFonts.f14w400,
            ),
            SizedBox(
              height: 20.h,
            ),
            Form(
              key: formKey,
              child: CustomTextField(
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return LangKeys.requiredEmail.tr;
                  } else if (value!.contains('@gmail.com') == false) {
                    return LangKeys.validEmail.tr;
                  }
                },
                controller: email,
                hintText: LangKeys.email.tr,
              ),
            ),
            const Spacer(),
            Customelinearbutton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    Helper.customeLoadingSnac(title: LangKeys.sendingOtp.tr);
                    int randomNumber = await Sendotp().generateRandomNumber(4);

                    await Sendotp().sendEmailWithSendGrid(
                        email: email.text, randomNumber: randomNumber);
                    Get.to(
                        () => Otpverification(
                              email: email.text,
                              otp: randomNumber,
                            ),
                        curve: Appcurves.curves);
                  }
                },
                child: Text(
                  LangKeys.sendPass.tr,
                  style: AppFonts.f24w700.copyWith(color: Colors.white),
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

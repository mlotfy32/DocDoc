import 'dart:developer';

import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:docdoc/Features/auth/login/Presentation/viewModel/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otpverification extends StatefulWidget {
  const Otpverification({super.key, required this.otp, required this.email});
  final int otp;
  final String email;

  @override
  State<Otpverification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<Otpverification> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30.h),
            Text(
              LangKeys.otpVer.tr,
              style: AppFonts.f24w700,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              LangKeys.addPin.tr,
              style: AppFonts.f14w400,
            ),
            SizedBox(
              height: 20.h,
            ),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              appContext: context,
              length: 4,
              controller: otpController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                inactiveColor: Colors.grey,
                selectedColor: Colors.blue,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () async {
                    Helper.customeLoadingSnac(title: LangKeys.sendingOtp.tr);

                    await Sendotp().sendEmailWithSendGrid(
                        email: widget.email, randomNumber: widget.otp);
                  },
                  child: Text(
                    LangKeys.resendOtp.tr,
                    style: AppFonts.f16w600
                        .copyWith(color: const Color(0xff247CFF)),
                  )),
            ),
            Customelinearbutton(
                onTap: () {
                  if (otpController.text == widget.otp.toString()) {
                    BlocProvider.of<LoginCubit>(context).login(
                        email: widget.email,
                        password: widget.otp.toString(),
                        endPoint: 'auth/login');
                  } else {
                    Helper.FlutterToast(
                        title: 'Wrong Otp Please Try Again', success: false);
                  }
                },
                child: Text(
                  LangKeys.submit.tr,
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

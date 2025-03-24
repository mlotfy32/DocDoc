import 'dart:developer';

import 'package:docdoc/Core/Utiles/appCubites/passwordvisability/passwordvisability_cubit.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/auth/faceId/presentation/view/faceIdView.dart';
import 'package:docdoc/Features/auth/login/Presentation/view/widgets/forgetPass.dart';
import 'package:docdoc/Features/auth/login/Presentation/viewModel/change_checkbox/change_checkbox_cubit.dart';
import 'package:docdoc/Features/auth/login/Presentation/viewModel/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomeLoginForm extends StatelessWidget {
  CustomeLoginForm({super.key, required this.email, required this.pass});
  final TextEditingController email;
  final TextEditingController pass;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isVisable = true;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Helper.FlutterToast(title: LangKeys.succlogin.tr, success: true);
          Get.offAll(() => const Faceidview(), curve: Appcurves.curves);
        } else if (state is LoginFailure) {
          Helper.FlutterToast(title: LangKeys.wrongEmailPass, success: false);
        }
      },
      child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LangKeys.requiredEmail.tr;
                    } else if (value!.contains('@gmail.com') == false) {
                      return LangKeys.validEmail;
                    }
                  },
                  controller: email,
                  hintText: LangKeys.email.tr,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(height: 20.h),
              BlocBuilder<PasswordvisabilityCubit, PasswordvisabilityState>(
                builder: (context, state) {
                  isVisable = state is Passwordvisability
                      ? state.isPasswordVisible
                      : isVisable;
                  return CustomTextField(
                    controller: pass,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LangKeys.requiredPass.tr;
                      } else if (value.length < 8) {
                        return LangKeys.validPasswrod.tr;
                      }
                    },
                    hintText: LangKeys.password.tr,
                    obscureText: isVisable,
                    suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<PasswordvisabilityCubit>(context)
                              .changeVisability(isVisable: !isVisable);
                        },
                        icon: Icon(
                          size: 20,
                          state is Passwordvisability &&
                                  state.isPasswordVisible == false
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: const Color(0xff757575),
                        )),
                  );
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocProvider<ChangeCheckboxCubit>(
                create: (context) => ChangeCheckboxCubit(),
                child: const Forgetpass(),
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return Customelinearbutton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).login(
                              email: email.text,
                              password: pass.text,
                              endPoint: 'auth/login');
                        }
                      },
                      child: state is LoginLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              LangKeys.login.tr,
                              style: AppFonts.f24w700
                                  .copyWith(color: Colors.white),
                            ),
                      width: Get.size.width,
                      height: 50.h,
                      color: const Color(0xff247CFF));
                },
              ),
            ],
          )),
    );
  }
}

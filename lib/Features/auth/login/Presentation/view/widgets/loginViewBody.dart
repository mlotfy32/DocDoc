import 'package:docdoc/Core/Utiles/appCubites/passwordvisability/passwordvisability_cubit.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/auth/login/Presentation/view/widgets/conditions.dart';
import 'package:docdoc/Features/auth/login/Presentation/view/widgets/customeAuthRow.dart';
import 'package:docdoc/Features/auth/login/Presentation/view/widgets/customeLoginForm.dart';
import 'package:docdoc/Features/auth/login/Presentation/view/widgets/forgetPass.dart';
import 'package:docdoc/Features/auth/login/Presentation/viewModel/change_checkbox/change_checkbox_cubit.dart';
import 'package:docdoc/Features/auth/login/Presentation/viewModel/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Loginviewbody extends StatefulWidget {
  const Loginviewbody({super.key});

  @override
  State<Loginviewbody> createState() => _LoginviewbodyState();
}

class _LoginviewbodyState extends State<Loginviewbody> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: Text(
                LangKeys.welcomeBack.tr,
                style: AppFonts.f24w700,
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  LangKeys.wearExcited.tr,
                  style: AppFonts.f14w400,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40.h,
                ),
              ),
              SliverToBoxAdapter(
                child: BlocProvider<PasswordvisabilityCubit>(
                  create: (context) => PasswordvisabilityCubit(),
                  child: CustomeLoginForm(
                    email: email,
                    pass: pass,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 25.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '-----------------------------',
                    style: AppFonts.f11w400,
                  ),
                  Text(LangKeys.orSign.tr,
                      style: AppFonts.f12w400
                          .copyWith(color: const Color(0xff9E9E9E))),
                  Text(
                    '-----------------------------',
                    style: AppFonts.f11w400,
                  )
                ],
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 25.h,
                ),
              ),
              const SliverToBoxAdapter(
                child: Customeauthrow(),
              ),
              const SliverToBoxAdapter(
                child: Conditions(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

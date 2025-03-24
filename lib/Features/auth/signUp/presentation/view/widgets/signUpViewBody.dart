import 'package:docdoc/Core/Utiles/appCubites/passwordvisability/passwordvisability_cubit.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/auth/login/Presentation/view/widgets/customeLoginForm.dart';
import 'package:docdoc/Features/auth/signUp/presentation/view/widgets/customeeSignUpForm.dart';
import 'package:docdoc/Features/auth/signUp/presentation/viewModel/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signupviewbody extends StatefulWidget {
  const Signupviewbody({super.key});

  @override
  State<Signupviewbody> createState() => _SignupviewbodyState();
}

class _SignupviewbodyState extends State<Signupviewbody> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    name.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: Text(
                'Create Account',
                style: AppFonts.f24w700,
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  '''Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!''',
                  style: AppFonts.f14w400,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                child: MultiBlocProvider(
                    providers: [
                      BlocProvider<PasswordvisabilityCubit>(
                          create: (context) => PasswordvisabilityCubit()),
                      BlocProvider<SignupCubit>(
                          create: (context) => SignupCubit())
                    ],
                    child: Customeesignupform(
                        phone: phone, email: email, pass: pass, name: name)),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 25.h,
                ),
              ),

              // const SliverToBoxAdapter(
              //   child: Customeauthrow(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCubites/passwordvisability/passwordvisability_cubit.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/image_Picker.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/auth/faceId/presentation/view/faceIdView.dart';
import 'package:docdoc/Features/auth/login/Presentation/view/loginView.dart';
import 'package:docdoc/Features/auth/login/Presentation/view/widgets/forgetPass.dart';
import 'package:docdoc/Features/auth/login/Presentation/viewModel/change_checkbox/change_checkbox_cubit.dart';
import 'package:docdoc/Features/auth/login/Presentation/viewModel/login/login_cubit.dart';
import 'package:docdoc/Features/auth/signUp/presentation/view/widgets/customeDropDown.dart';
import 'package:docdoc/Features/auth/signUp/presentation/viewModel/signup/signup_cubit.dart';
import 'package:docdoc/Features/home/presentation/view/homeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Customeesignupform extends StatelessWidget {
  Customeesignupform(
      {super.key,
      required this.email,
      required this.pass,
      required this.name,
      required this.phone});
  final TextEditingController email;
  final TextEditingController pass;
  final TextEditingController name;
  final TextEditingController phone;

  final formKey = GlobalKey<FormState>();
  List<String> hasImage = [];
  @override
  Widget build(BuildContext context) {
    bool isVisable = true;
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Helper.FlutterToast(title: 'Loggedin Successfuly.', success: true);
          Get.offAll(() => const Faceidview(), curve: Appcurves.curves);
        } else if (state is SignupFailure) {
          Helper.FlutterToast(
              title:
                  '${state.data.email} ${state.data.phone} ${state.data.password}',
              success: false);
        }
      },
      child: Form(
          key: formKey,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  ImagePick().pickImage(context: context);
                },
                child: BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {
                    if (state is ImageLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ImageSuccess && hasImage.isEmpty) {
                      hasImage.add(state.image);
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                          state.image,
                          fit: BoxFit.cover,
                          width: 100.w,
                          height: 80.h,
                        ),
                      );
                    } else {
                      return SizedBox(
                          width: 100.w,
                          height: 80.h,
                          child: Stack(
                            children: [
                              hasImage.isEmpty
                                  ? Image.asset(
                                      AppImages.userAvatar,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: Image.network(
                                        fit: BoxFit.cover,
                                        width: 100.w,
                                        height: 80.h,
                                        hasImage.first,
                                      ),
                                    ),
                              hasImage.isEmpty
                                  ? const Padding(
                                      padding:
                                          EdgeInsets.only(right: 2, bottom: 5),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.blue,
                                          size: 30,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink()
                            ],
                          ));
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone is required';
                    }
                    return null;
                  },
                  controller: phone,
                  hintText: 'Phone',
                  keyboardType: TextInputType.emailAddress),
              SizedBox(height: 20.h),
              CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  controller: name,
                  hintText: 'Name',
                  keyboardType: TextInputType.emailAddress),
              SizedBox(height: 20.h),
              CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (value!.contains('@gmail.com') == false) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  controller: email,
                  hintText: 'Email',
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
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password can`t be less than 8 characters';
                      }
                      return null;
                    },
                    hintText: 'Password',
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
              const Align(
                  alignment: Alignment.centerLeft,
                  child: const CustomeDropButton()),
              SizedBox(
                height: 10.h,
              ),
              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  return Customelinearbutton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          if (hasImage.isNotEmpty) {
                            BlocProvider.of<SignupCubit>(context).Signup(
                                profileUrl: hasImage.first,
                                name: name.text,
                                phone: phone.text,
                                gender: '0',
                                email: email.text,
                                endPoint: 'auth/register',
                                password: pass.text);
                          } else {
                            Helper.FlutterToast(
                                title: 'Please add your image', success: false);
                          }
                        }
                        if (hasImage.isEmpty) {
                          Helper.FlutterToast(
                              title: 'Please add your image', success: false);
                        }
                      },
                      child: state is SignupLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Create Account',
                              style: AppFonts.f24w700
                                  .copyWith(color: Colors.white),
                            ),
                      width: Get.size.width,
                      height: 50.h,
                      color: const Color(0xff247CFF));
                },
              ),
              TextButton(
                  onPressed: () {
                    Get.off(() => const Loginview(), curve: Appcurves.curves);
                  },
                  child: Text(
                    'Already have an account !',
                    style: AppFonts.f16w600
                        .copyWith(color: const Color(0xff247CFF)),
                  ))
            ],
          )),
    );
  }
}
/*

*/

import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/auth/forgetpass/presentation/view/forgetPassView.dart';
import 'package:docdoc/Features/auth/login/Presentation/viewModel/change_checkbox/change_checkbox_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<ChangeCheckboxCubit, ChangeCheckboxState>(
          builder: (context, state) {
            return Checkbox(
              value: state is ChangeCheckbox && state.isChecked
                  ? state.isChecked
                  : false,
              onChanged: (bool? value) {
                BlocProvider.of<ChangeCheckboxCubit>(context)
                    .changeCheck(isChecked: value!);
              },
            );
          },
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          LangKeys.rememberMe.tr,
          style: AppFonts.f12w400.copyWith(color: const Color(0xff9E9E9E)),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Get.to(() => const Forgetpassview(), curve: Appcurves.curves);
          },
          child: Text(
            LangKeys.forgotPass.tr,
            style: AppFonts.f12w400,
          ),
        )
      ],
    );
  }
}

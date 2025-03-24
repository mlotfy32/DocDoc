import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
// import 'package:docdoc/Features/auth/signUp/presentation/viewModel/changegender/changegender_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeDropButton extends StatelessWidget {
  const CustomeDropButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 30.h,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: const RotatedBox(
            quarterTurns: -1,
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff247CFF),
              size: 24,
            ),
          ),
          value: items[0]
          // state is Changegender && state.gender == 'Male'
          //     ? items[0]
          //     : state is Changegender && state.gender == 'Female'
          //         ? items[1]
          //         : items[0]
          ,
          onChanged: (String? newValue) {
            // BlocProvider.of<ChangegenderCubit>(context)
            //     .Changegender(gender: newValue!);
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(value,
                    style: AppFonts.f16w600
                        .copyWith(color: const Color(0xff247CFF))),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

const List<String> items = ['Male', 'Female'];

import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:flutter/material.dart';

class BorderButon extends StatelessWidget {
  const BorderButon(
      {super.key,
      required this.w,
      required this.h,
      required this.textColor,
      required this.title,
      required this.backColor,
      required this.onTap});
  final double w;
  final double h;
  final Color textColor;
  final String title;
  final Color backColor;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: w,
        height: h,
        child: Text(
          title,
          style: AppFonts.f16w600.copyWith(color: textColor),
        ),
        decoration: BoxDecoration(
            color: backColor,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

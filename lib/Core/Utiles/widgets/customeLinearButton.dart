import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customelinearbutton extends StatelessWidget {
  const Customelinearbutton(
      {super.key,
      required this.onTap,
      required this.child,
      required this.width,
      required this.height,
      required this.color});
  final Function()? onTap;
  final Widget child;
  final double width;
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white30,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        width: width.w,
        height: height.h,
        decoration: ShapeDecoration(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Center(child: child),
      ),
    );
  }
}

import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessageDoctor extends StatelessWidget {
  const MessageDoctor(
      {super.key,
      required this.doctor,
      required this.doctorImage,
      required this.review});
  final GetDoctors doctor;
  final String doctorImage;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          width: 168.w,
          height: 130.h,
          doctorImage,
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(width: 5.w),
      SizedBox(
          width: Get.size.width - 193,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              overflow: TextOverflow.ellipsis,
              'Dr. ${doctor.name}',
              style: AppFonts.f18w600.copyWith(color: const Color(0xff242424)),
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              'General | ${doctor.description}',
              style: AppFonts.f18w600.copyWith(color: const Color(0xff242424)),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text(
                  overflow: TextOverflow.ellipsis,
                  review,
                  style:
                      AppFonts.f13w400.copyWith(color: const Color(0xff242424)),
                ),
              ],
            )
          ]))
    ]);
  }
}

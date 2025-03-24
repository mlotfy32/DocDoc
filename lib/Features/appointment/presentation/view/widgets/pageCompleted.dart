import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageComplete extends StatelessWidget {
  const PageComplete({super.key, required this.canceld});
  final bool canceld;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height - 174.h,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          height: 170.h,
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    blurRadius: BorderSide.strokeAlignOutside,
                    color: Colors.black26,
                    offset: Offset(3, 4),
                    blurStyle: BlurStyle.solid)
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          canceld == false
                              ? 'Appointment done'
                              : 'Appointment cancelled',
                          style: AppFonts.f14w400.copyWith(
                              color: canceld == false
                                  ? Colors.greenAccent
                                  : Colors.redAccent)),
                      Text(
                          overflow: TextOverflow.ellipsis,
                          'Wed, 17 May | 08.30 AM',
                          style: AppFonts.f14w400),
                    ],
                  ),
                  const Icon(Icons.keyboard_control_rounded)
                ],
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Divider()),
              Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    width: 130.w,
                    height: 100.h,
                    canceld == false
                        ? AppImages.recommentedDoctors.last
                        : AppImages.recommentedDoctors[2],
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 5.w),
                SizedBox(
                    width: Get.size.width - 151,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            canceld == false
                                ? 'Dr. Randy Wigham'
                                : 'Dr. Jack Sulivan',
                            style: AppFonts.f18w600
                                .copyWith(color: const Color(0xff242424)),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            'General Medical Checkup',
                            style: AppFonts.f18w600
                                .copyWith(color: const Color(0xff242424)),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber),
                              Text(
                                overflow: TextOverflow.ellipsis,
                                '4.8 (4,279 reviews)',
                                style: AppFonts.f13w400
                                    .copyWith(color: const Color(0xff242424)),
                              ),
                            ],
                          )
                        ]))
              ])
            ],
          ),
        ),
      ),
    );
  }
}

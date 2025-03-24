import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/notification/presentation/view/notificationView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Customehomeappbar extends StatelessWidget {
  const Customehomeappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${LangKeys.hi.tr} Mhmd!',
              style: AppFonts.f18w700,
            ),
            SizedBox(height: 2.h),
            Text(
              LangKeys.hor.tr,
              style: AppFonts.f13w400,
            ),
          ],
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: IconButton(
                    onPressed: () {
                      Get.to(() => const Notificationview(),
                          curve: Appcurves.curves);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.bell,
                      color: Colors.blue,
                    )),
              ),
              // const Padding(
              //   padding: const EdgeInsets.only(left: 25.0),
              //   child: CircleAvatar(
              //     radius: 5,
              //     backgroundColor: Colors.red,
              //   ),
              // )
            ],
          ),
        )
      ],
    );
  }
}

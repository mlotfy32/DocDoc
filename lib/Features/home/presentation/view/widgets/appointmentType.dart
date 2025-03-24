import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppointmentType extends StatelessWidget {
  const AppointmentType({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      FontAwesomeIcons.person,
      FontAwesomeIcons.video,
      FontAwesomeIcons.phone
    ];
    List<String> strings = ['In Person', 'Video Call', 'Phone Call'];
    return SizedBox(
      height: 140.h,
      width: Get.size.width,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => SizedBox(
          height: 55,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(icons[index],
                    color: index == 0
                        ? Colors.blue
                        : index == 1
                            ? Colors.teal
                            : Colors.red),
              ),
              const SizedBox(width: 15),
              Text(strings[index],
                  style: AppFonts.f16w600.copyWith(color: Colors.black87)),
              const Spacer(),
              Checkbox(
                value: index == 0 ? true : false,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

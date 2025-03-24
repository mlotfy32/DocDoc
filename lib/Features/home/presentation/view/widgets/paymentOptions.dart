import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> payment = [
      'Master Card',
      'American Express',
      'Capital One',
      'Barclays'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Option',
          style: AppFonts.f18w700,
        ),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            SizedBox(width: 20.w),
            Text(
              'Credit Card',
              style: AppFonts.f18w500,
            ),
          ],
        ),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 30),
            separatorBuilder: (context, index) => SizedBox(
              width: Get.size.width - 50,
              child: const Divider(),
            ),
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Image.network(AppImages.payment[index],
                      width: 60, height: 40),
                  const SizedBox(width: 20),
                  Text(
                    payment[index],
                    style: AppFonts.f14w400.copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
        Row(children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          Text(
            'Bank Transfer',
            style: AppFonts.f18w500,
          )
        ]),
        Row(children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          Text(
            'Paypal',
            style: AppFonts.f18w500,
          )
        ]),
        const SizedBox(height: 150)
      ],
    );
  }
}

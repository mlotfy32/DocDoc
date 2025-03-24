import 'package:docdoc/Core/Utiles/loading/1.2%20loading_shimmer.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GetDoctorSpiLoading extends StatelessWidget {
  const GetDoctorSpiLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height - 100,
      child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 236.h, crossAxisSpacing: 2),
          itemBuilder: (context, index) {
            String review =
                ' ${Sendotp.otp.generateRandomNumber(1)}.${Sendotp.otp.generateRandomNumber(1)} (${Sendotp.otp.generateRandomNumber(1)}.${Sendotp.otp.generateRandomNumber(3)} reviews)';
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 100,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    blurRadius: BorderSide.strokeAlignOutside,
                    color: Colors.black26,
                    offset: Offset(3, 4),
                    blurStyle: BlurStyle.solid)
              ], borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoadingShimmer(
                    width: 150,
                    height: 170,
                    borderRadius: 15,
                  ),
                  LoadingShimmer(width: 150, height: 15),
                  LoadingShimmer(width: 150, height: 15),
                  LoadingShimmer(width: 150, height: 15)
                ],
              ),
            );
          }),
    );
  }
}

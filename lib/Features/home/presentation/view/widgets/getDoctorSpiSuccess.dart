import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/home/presentation/view/widgets/doctorDetailes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class getDoctorsSpeciSucc extends StatelessWidget {
  const getDoctorsSpeciSucc({
    super.key,
    required this.doctors,
    required this.id,
  });
  final List<GetDoctors> doctors;
  final int id;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height - 100,
      child: GridView.builder(
          itemCount: doctors.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 236.h, crossAxisSpacing: 2),
          itemBuilder: (context, index) {
            String review =
                ' ${Sendotp.otp.generateRandomNumber(1)}.${Sendotp.otp.generateRandomNumber(1)} (${Sendotp.otp.generateRandomNumber(1)}.${Sendotp.otp.generateRandomNumber(3)} reviews)';
            return InkWell(
              onTap: () => Get.to(() => Doctordetailes(
                  doctor: doctors[index],
                  doctorImage: AppImages.recommentedDoctors[id + index],
                  review: review)),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: BorderSide.strokeAlignOutside,
                          color: Colors.black26,
                          offset: Offset(3, 4),
                          blurStyle: BlurStyle.solid)
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          AppImages.recommentedDoctors[id + index],
                          width: double.infinity,
                          height: 150.h,
                          fit: BoxFit.fill,
                        )),
                    Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(children: [
                          TextSpan(
                            text: 'DR | ',
                            style:
                                AppFonts.f16w600.copyWith(color: Colors.black),
                          ),
                          TextSpan(
                            text: doctors[index].name,
                            style: AppFonts.f18w500
                                .copyWith(color: Colors.black54),
                          ),
                        ])),
                    Text.rich(
                        overflow: TextOverflow.ellipsis,
                        TextSpan(children: [
                          TextSpan(
                            text: 'General | ',
                            style:
                                AppFonts.f16w600.copyWith(color: Colors.black),
                          ),
                          TextSpan(
                            text: doctors[index].description,
                            style: AppFonts.f18w500
                                .copyWith(color: Colors.black54),
                          ),
                        ])),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          review,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

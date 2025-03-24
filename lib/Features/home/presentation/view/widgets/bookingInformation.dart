import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BookingInformation extends StatelessWidget {
  const BookingInformation(
      {super.key,
      required this.doctor,
      required this.review,
      required this.doctorImage});
  final GetDoctors doctor;
  final String review;
  final String doctorImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height - 173.h,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              'Booking Information',
              style: AppFonts.f18w700,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                CircleAvatar(
                    radius: 27,
                    backgroundColor: const Color(0xffFFEAF2FF),
                    child: SvgPicture.asset(AppImages.dateTime,
                        fit: BoxFit.scaleDown, width: 40, height: 40)),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date & Time', style: AppFonts.f18w700),
                    Text('Wednesday, 26 Mar ${DateTime.now().year}',
                        style: AppFonts.f14w400),
                    Text('08 : 30 AM', style: AppFonts.f14w400)
                  ],
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Divider())),
          SliverToBoxAdapter(
            child: Row(
              children: [
                CircleAvatar(
                    radius: 27,
                    backgroundColor: const Color(0xffFFE9FAEF),
                    child: SvgPicture.asset(AppImages.appointmentType,
                        fit: BoxFit.scaleDown, width: 60, height: 60)),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Appointment Type', style: AppFonts.f18w700),
                    Text('In Person', style: AppFonts.f14w400),
                  ],
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Divider())),
          SliverToBoxAdapter(
            child: Text('Doctor Information', style: AppFonts.f18w700),
          ),
          SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: Get.size.width,
                  height: 100.h,
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        width: 150.w,
                        height: 100.h,
                        doctorImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    SizedBox(
                        width: Get.size.width - 217,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                overflow: TextOverflow.ellipsis,
                                doctor.name,
                                style: AppFonts.f18w600
                                    .copyWith(color: const Color(0xff242424)),
                              ),
                              Text(
                                overflow: TextOverflow.ellipsis,
                                'General | ${doctor.description}',
                                style: AppFonts.f18w600
                                    .copyWith(color: const Color(0xff242424)),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    review,
                                    style: AppFonts.f13w400.copyWith(
                                        color: const Color(0xff242424)),
                                  ),
                                ],
                              )
                            ]))
                  ]))),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Text('Payment Information', style: AppFonts.f18w700),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
              child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  AppImages.payment[0],
                  width: 60,
                  fit: BoxFit.fill,
                  height: 50,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Master Card',
                      style: AppFonts.f16w600.copyWith(color: Colors.black)),
                  Text('**** **** **** 1234', style: AppFonts.f14w400),
                ],
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                width: 130,
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Change',
                  style: AppFonts.f16w600.copyWith(color: Colors.blue),
                ),
              )
            ],
          )),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Payment Info', style: AppFonts.f18w700),
                Row(
                  children: [
                    Text('Subtotal', style: AppFonts.f14w400),
                    const Spacer(),
                    Text('\$ ${doctor.appoint_price}', style: AppFonts.f18w500),
                  ],
                ),
                Row(
                  children: [
                    Text('Tax', style: AppFonts.f14w400),
                    const Spacer(),
                    Text('\$ 250', style: AppFonts.f18w500),
                  ],
                ),
                Row(
                  children: [
                    Text('Payment Total', style: AppFonts.f18w500),
                    const Spacer(),
                    Text('\$ ${250 + doctor.appoint_price}',
                        style: AppFonts.f18w500),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/loading/1.2%20loading_shimmer.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/appointment/presentation/view/widgets/pageUpcoming.dart';
import 'package:docdoc/Features/appointment/presentation/viewModel/getAllAppointment/getallappointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class Notificationviewbody extends StatefulWidget {
  const Notificationviewbody({super.key});

  @override
  State<Notificationviewbody> createState() => _NotificationviewbodyState();
}

class _NotificationviewbodyState extends State<Notificationviewbody> {
  @override
  void initState() {
    BlocProvider.of<GetallappointmentCubit>(context).getAllAppointment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Container(
                margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
              centerTitle: true,
              title: Expanded(
                  child: Text(
                overflow: TextOverflow.ellipsis,
                'Notification',
                style: AppFonts.f20w700,
              )),
              actions: [
                Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('1 New',
                      style: AppFonts.f16w600
                          .copyWith(fontWeight: FontWeight.w400)),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child:
                  BlocBuilder<GetallappointmentCubit, GetallappointmentState>(
                builder: (context, state) {
                  if (state is GetallappointmentSuccess) {
                    if (state.appointments.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 300),
                        child: Center(
                            child: Text('No Notification Found',
                                style: AppFonts.f20w700)),
                      );
                    } else {
                      return SizedBox(
                        height: Get.size.height - 95,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              String time = timeago.format(
                                  state.appointments[index].dateTime,
                                  locale: 'en_short');
                              return InkWell(
                                onTap: () => Get.to(() =>
                                    BlocProvider<GetallappointmentCubit>(
                                      create: (context) =>
                                          GetallappointmentCubit(),
                                      child:
                                          const Pageupcoming(isAppoint: true),
                                    )),
                                child: Container(
                                    child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.appointmentType,
                                      width: 50,
                                      height: 30,
                                      fit: BoxFit.fill,
                                      color: Colors.blueAccent,
                                    ),
                                    const SizedBox(width: 4),
                                    SizedBox(
                                      width: Get.size.width - 80,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Appointment Success',
                                                style: AppFonts.f18w500),
                                            Text(
                                                '''Congratulations - your appointment is confirmed! We're looking forward to meeting with you and helping you achieve your goals.''',
                                                style: AppFonts.f16w600
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey)),
                                          ]),
                                    ),
                                    Text(
                                      time,
                                      style: AppFonts.f14w400,
                                    )
                                  ],
                                )),
                              );
                            },
                            separatorBuilder: (context, index) => const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(),
                                ),
                            itemCount: state.appointments.length),
                      );
                    }
                  } else {
                    return SizedBox(
                      height: Get.size.height - 95,
                      child: ListView.builder(
                          itemBuilder: (context, index) => const ListTile(
                              leading: LoadingShimmer(width: 45, height: 30),
                              title: Column(
                                children: [
                                  LoadingShimmer(
                                    width: 140,
                                    height: 25,
                                  ),
                                  LoadingShimmer(
                                    width: 140,
                                    height: 25,
                                  ),
                                ],
                              ))),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

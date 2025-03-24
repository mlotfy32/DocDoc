import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/appointment/presentation/view/widgets/borderButton.dart';
import 'package:docdoc/Features/appointment/presentation/viewModel/getAllAppointment/getallappointment_cubit.dart';
import 'package:docdoc/Features/messages/presentation/view/widgets/sendMessages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Pageupcoming extends StatefulWidget {
  const Pageupcoming({super.key, required this.isAppoint});
  final bool isAppoint;
  @override
  State<Pageupcoming> createState() => _PageupcomingState();
}

class _PageupcomingState extends State<Pageupcoming> {
  @override
  void initState() {
    BlocProvider.of<GetallappointmentCubit>(context).getAllAppointment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          widget.isAppoint
              ? SliverAppBar(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: Text(
                    overflow: TextOverflow.ellipsis,
                    'My Appointment',
                    style: AppFonts.f20w700,
                  ))
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
          SliverToBoxAdapter(
            child: SizedBox(
                height: widget.isAppoint
                    ? Get.size.height - 90
                    : Get.size.height - 174.h,
                child:
                    BlocBuilder<GetallappointmentCubit, GetallappointmentState>(
                        builder: (context, state) {
                  if (state is GetallappointmentSuccess) {
                    if (state.appointments.isEmpty) {
                      return Center(
                        child: Text(
                          'No appointment found.',
                          style: AppFonts.f18w700,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: state.appointments.length,
                        itemBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 170.h,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 5),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        AppImages.recommentedDoctors[index],
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      )),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 174,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  '${state.appointments[index].doctorName}',
                                                  style: AppFonts.f18w600
                                                      .copyWith(
                                                          color: const Color(
                                                              0xff242424)),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              'General | ${state.appointments[index].general}',
                                              style: AppFonts.f18w600.copyWith(
                                                  color:
                                                      const Color(0xff242424)),
                                            ),
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              '${state.appointments[index].date} | ${state.appointments[index].time}',
                                              style: AppFonts.f13w400.copyWith(
                                                  color:
                                                      const Color(0xff242424)),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Divider()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BorderButon(
                                      onTap: () {
                                        state.appointments[index].delete();
                                        BlocProvider.of<GetallappointmentCubit>(
                                                context)
                                            .getAllAppointment();
                                      },
                                      w: 160,
                                      h: 50,
                                      textColor: Colors.blue,
                                      title: 'Cancel Appointment',
                                      backColor: Colors.white),
                                  BorderButon(
                                      onTap: () {},
                                      w: 150,
                                      h: 50,
                                      textColor: Colors.white,
                                      title: 'Reschedule',
                                      backColor: Colors.blue),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(top: 220),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                })),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/home/presentation/viewModel/changepageviewcontent/changepageviewcontent_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Pageview1 extends StatefulWidget {
  const Pageview1({super.key, required this.doctor});
  final GetDoctors doctor;
  @override
  State<Pageview1> createState() => _Pageview1State();
}

class _Pageview1State extends State<Pageview1> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  void initState() {
    BlocProvider.of<ChangepageviewcontentCubit>(context)
        .changePageViewContent(cityName: widget.doctor.city.governrate.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangepageviewcontentCubit, ChangepageviewcontentState>(
      builder: (context, state) {
        if (state is ChangepageviewcontentSuccess) {
          Set<Marker> markers = <Marker>{
            Marker(markerId: const MarkerId('1'), position: state.latLng)
          };
          return SizedBox(
            height: Get.size.height - 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Practice Place', style: AppFonts.f18w700),
                Text(
                    '${widget.doctor.city.name} . ${widget.doctor.city.governrate.name}',
                    style: AppFonts.f14w400),
                Text('Location Map', style: AppFonts.f18w700),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: Get.size.height - 222.h,
                  width: double.infinity,
                  child: GoogleMap(
                    markers: markers,
                    myLocationEnabled: true,
                    initialCameraPosition: state.cameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

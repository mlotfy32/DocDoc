import 'dart:async';
import 'dart:developer';

import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Features/auth/forgetpass/data/sendOTP.dart';
import 'package:docdoc/Features/home/data/location/googleMapsServices.dart';
import 'package:docdoc/Features/home/presentation/viewModel/change_map/change_map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/adapters.dart';

class Findnearby extends StatefulWidget {
  const Findnearby({super.key});

  @override
  State<Findnearby> createState() => _FindnearbyState();
}

class _FindnearbyState extends State<Findnearby> {
  @override
  void initState() {
    BlocProvider.of<ChangeMapCubit>(context).chageMap();
    super.initState();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  TextEditingController search = TextEditingController();
  final image = NetworkImage(AppImages.recommentedDoctors.first)
      .resolve(ImageConfiguration.empty);
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Find Nearby',
          style: AppFonts.f18w700,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: BlocBuilder<ChangeMapCubit, ChangeMapState>(
        builder: (context, state) {
          if (state is ChangeMapSuccess) {
            return Container(
              child: Stack(
                children: [
                  GoogleMap(
                    myLocationEnabled: true,
                    markers: MapServices.getMarkers(context: context),
                    initialCameraPosition: state.cameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.size.width - 60.w,
                            child: Form(
                              // key: formKey,
                              child: CustomTextField(
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return 'enter doctor name';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  // if (formKey.currentState!.validate()) {
                                  //   BlocProvider.of<SearchdoctorCubit>(context)
                                  //       .searchDoctor(search: SearchModel(search: search.text));
                                  // }
                                },
                                controller: search,
                                hintText: 'Search',
                                fillColour: Colors.white,
                                filled: true,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Color(0xff9E9E9E),
                                  size: 34,
                                ),
                              ),
                            ),
                          ),
                          Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Icon(
                                FontAwesomeIcons.sliders,
                                color: Colors.blue,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/image_Picker.dart';
import 'package:docdoc/Core/Utiles/loading/1.2%20loading_shimmer.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Core/Utiles/widgets/customeLinearButton.dart';
import 'package:docdoc/Features/auth/signUp/presentation/viewModel/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserInformation extends StatefulWidget {
  const UserInformation(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.userImage});
  final String name;
  final String email;
  final String phone;
  final String userImage;

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 35),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  backgroundColor: Colors.white,
                  leading: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
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
                    'Personal information',
                    style: AppFonts.f20w700,
                  ))),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          ImagePick().pickImage(context: context);
                        },
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: BlocBuilder<SignupCubit, SignupState>(
                              builder: (context, state) {
                                if (state is ImageLoading) {
                                  return const LoadingShimmer(
                                    width: 150,
                                    height: 100,
                                  );
                                } else if (state is ImageSuccess) {
                                  return CircleAvatar(
                                      radius: 55,
                                      backgroundImage:
                                          NetworkImage(state.image));
                                }
                                return const CircleAvatar(
                                    radius: 55,
                                    backgroundImage:
                                        AssetImage(AppImages.profile));
                              },
                            ),
                            radius: 60.0,
                          ),
                        ),
                      ),
                      const Positioned(
                          top: 50,
                          left: 210,
                          child: const Icon(Icons.edit, color: Colors.blue))
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          List<String> data = [];
                          data.add(widget.name!);
                          data.add(widget.email!);
                          data.add('${widget.phone}'!);

                          return SizedBox(
                              height: 70,
                              child: CustomTextField(
                                controller: controller,
                                hintText: '${data[index]}',
                              ));
                        }),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Text(
                  textAlign: TextAlign.center,
                  'When you set up your personal information settings, you should take care to provide accurate information.',
                  style: AppFonts.f14w400,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Customelinearbutton(
                    onTap: null,
                    child: Text(
                      'Save',
                      style: AppFonts.f20w700.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    width: double.infinity,
                    height: 50,
                    color: Colors.blueAccent),
              )
            ],
          ),
        ),
        color: Colors.white);
  }
}

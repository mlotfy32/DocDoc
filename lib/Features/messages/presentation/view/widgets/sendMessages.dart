import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Features/home/data/models/getSpeclizationRes.dart';
import 'package:docdoc/Features/messages/presentation/viewModel/sendmessage/sendMessage.dart';
import 'package:docdoc/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Sendmessages extends StatefulWidget {
  Sendmessages(
      {super.key,
      required this.doctorPic,
      required this.name,
      required this.description});
  final String doctorPic;
  final String name;
  final String description;

  @override
  State<Sendmessages> createState() => _SendmessagesState();
}

class _SendmessagesState extends State<Sendmessages> {
  TextEditingController message = TextEditingController();
  ScrollController controller = ScrollController();

  void _scrollToEnd() {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var email = SharedPref().getString(PrefsKeys.email);
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                title: Column(
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'DR.${widget.name}',
                      style: AppFonts.f20w700,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          'online ',
                          style: AppFonts.f14w400,
                        ),
                        const CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green,
                        )
                      ],
                    ),
                  ],
                ),
                actions: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.video)),
                  ),
                ]),
            SliverToBoxAdapter(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection(widget.name)
                      // .where('DrName', isEqualTo: widget.doctor.name)
                      .orderBy('time')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                          height: Get.size.height - 130.h,
                          child:
                              const Center(child: CircularProgressIndicator()));
                    } else {
                      final documents = snapshot.data!.docs;
                      final List<String> _items = List.generate(
                          documents.length, (index) => 'Item ${index + 1}');
                      if (_items.isNotEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _scrollToEnd();
                        });
                      }
                      return SizedBox(
                        height: Get.size.height - 130.h,
                        child: ListView.builder(
                            itemCount: _items.length,
                            controller: controller,
                            itemBuilder: (context, index) {
                              final message = documents[index].data()
                                  as Map<String, dynamic>;

                              return InkWell(
                                onLongPress: () async {
                                  Get.defaultDialog(
                                      title: 'Delete Message',
                                      middleText: message['message'],
                                      titleStyle: AppFonts.f16w600
                                          .copyWith(color: Colors.black),
                                      confirm: TextButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection(widget.name)
                                                .doc(documents[index].id)
                                                .delete();
                                            Get.back();
                                          },
                                          child: Text(
                                            'Sure',
                                            style: AppFonts.f16w600
                                                .copyWith(color: Colors.red),
                                          )),
                                      cancel: TextButton(
                                          onPressed: () => Get.back(),
                                          child: Text(
                                            'Cancel',
                                            style: AppFonts.f16w600
                                                .copyWith(color: Colors.teal),
                                          )));
                                },
                                child: Align(
                                  alignment: message['userId'] == email
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        message['userId'] != email
                                            ? CrossAxisAlignment.start
                                            : CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            message['userId'] != email
                                                ? MainAxisAlignment.start
                                                : MainAxisAlignment.end,
                                        children: [
                                          message['userId'] != email
                                              ? CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      widget.doctorPic))
                                              : const SizedBox.shrink(),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 7),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            // width: Get.size.width - 100,
                                            child: Text(
                                              message['message'],
                                              style: AppFonts.f16w600.copyWith(
                                                  color:
                                                      message['userId'] == email
                                                          ? Colors.white
                                                          : Colors.black),
                                            ),
                                            decoration: BoxDecoration(
                                                color:
                                                    message['userId'] == email
                                                        ? Colors.blue
                                                        : Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        const Radius.circular(
                                                            15),
                                                    bottomRight:
                                                        const Radius.circular(
                                                            15),
                                                    topLeft: message['userId'] ==
                                                            email
                                                        ? const Radius.circular(
                                                            15)
                                                        : const Radius.circular(
                                                            0),
                                                    topRight: message['userId'] ==
                                                            email
                                                        ? const Radius.circular(
                                                            0)
                                                        : const Radius.circular(15))),
                                          ),
                                          message['userId'] == email
                                              ? const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      AppImages.profile))
                                              : const SizedBox.shrink(),
                                        ],
                                      ),
                                      Text(
                                        ' ${message['time']} ',
                                        style: AppFonts.f14w400,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                  }),
            ),
            SliverToBoxAdapter(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: Get.size.width - 70,
                    height: 50,
                    child: Center(
                      child: CustomTextField(
                        controller: message,
                        hintText: 'Send Message...',
                      ),
                    )),
                IconButton(
                    onPressed: message.text.isEmpty
                        ? null
                        : () {
                            Sendmessage.sendMessage(
                                DrGeneral: widget.description,
                                DrName: widget.name,
                                drPic: widget.doctorPic,
                                userId: email!,
                                collection: widget.name,
                                message: message.text);
                            message.clear();
                          },
                    icon: const Icon(FontAwesomeIcons.paperPlane,
                        color: Colors.blue))
              ],
            )),
          ],
        ),
      ),
    );
  }
}

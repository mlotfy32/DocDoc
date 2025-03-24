import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settingnotification extends StatefulWidget {
  const Settingnotification({super.key});

  @override
  State<Settingnotification> createState() => _SettingnotificationState();
}

class _SettingnotificationState extends State<Settingnotification> {
  @override
  bool noffi = true;

  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  leading: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                    LangKeys.notification.tr,
                    style: AppFonts.f20w700,
                  )),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                SliverList.separated(
                    itemCount: 4,
                    separatorBuilder: (context, index) => const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(),
                        ),
                    itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title[index],
                              style: AppFonts.f18w500,
                            ),
                            Switch.adaptive(
                              value: index == 0 ? noffi : true,
                              activeColor: Colors.green,
                              inactiveTrackColor: Colors.grey,
                              onChanged: (value) async {
                                noffi = value;
                                Helper.FlutterToast(
                                    title: noffi == true
                                        ? 'Notification Allowed'
                                        : 'Notification Not Allowed',
                                    success: value);
                                setState(() {});
                              },
                            )
                          ],
                        ))
              ],
            ),
          ),
        ),
        color: Colors.white);
  }
}

List<String> title = [
  'Notification from DocNow',
  'Sound',
  'Vibrate',
  'App Updates',
  'Special Offers'
];

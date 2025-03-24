import 'dart:developer';

import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/profile/data/settingsNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: SafeArea(
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
                  LangKeys.settings.tr,
                  style: AppFonts.f20w700,
                )),
              ),
              SliverList.separated(
                itemCount: titles.length,
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Settingsnavigation.instance.navigation(index: index);
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(
                        AppImages.settings[index],
                        height: 30,
                        color: index != 3 ? Colors.black : Colors.red,
                      ),
                      title: Text(titles[index].tr, style: AppFonts.f18w500),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size: 22,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> titles = [
  LangKeys.notification,
  LangKeys.security,
  LangKeys.language,
  LangKeys.logout
];

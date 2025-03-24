import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
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
                    'Security',
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
                              value: index == 1 || index == 2 ? false : true,
                              activeColor: Colors.green,
                              inactiveTrackColor: Colors.grey,
                              onChanged: (value) async {},
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
  'Remember password',
  'Face ID',
  'PIN',
  'Finger Print',
];

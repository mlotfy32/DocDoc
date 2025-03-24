import 'dart:developer';

import 'package:docdoc/Core/Utiles/appCubites/changelang/changelang_cubit.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    String _selectedValue = 'English';
    return Material(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: CustomScrollView(slivers: [
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
                  LangKeys.lang.tr,
                  style: AppFonts.f20w700,
                )),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(
                child: BlocBuilder<ChangelangCubit, ChangelangState>(
                  builder: (context, state) {
                    final cubit =
                        BlocProvider.of<ChangelangCubit>(context).lang;
                    _selectedValue = cubit != 'en' ? 'Arabic' : 'English';
                    return Column(
                      children: [
                        RadioListTile<String>(
                          title: Text('العربيه', style: AppFonts.f18w500),
                          value: 'Arabic',
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            BlocProvider.of<ChangelangCubit>(context)
                                .getSavedLanguage();
                          },
                        ),
                        const Padding(
                            padding: EdgeInsets.all(5), child: Divider()),
                        RadioListTile<String>(
                          title: Text('English', style: AppFonts.f18w500),
                          value: 'English',
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            BlocProvider.of<ChangelangCubit>(context)
                                .getSavedLanguage();
                          },
                        ),
                      ],
                    );
                  },
                ),
              )
            ]),
          ),
        ),
        color: Colors.white);
  }
}

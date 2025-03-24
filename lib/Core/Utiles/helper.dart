import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';

class Helper {
  static FlutterToast({required String title, required bool success}) {
    Fluttertoast.showToast(
        msg: title.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: success == false ? Colors.red : Colors.greenAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void customeLoadingSnac({required String title}) {
    Get.snackbar('Asroo Store', title,
        duration: const Duration(seconds: 1),
        titleText: Text(
          'DocDoc',
          style: AppFonts.f24w700,
        ),
        messageText: Text(
          title,
          // style: AppFonts.f19w500,
        ),
        snackPosition: SnackPosition.BOTTOM,
        showProgressIndicator: true);
  }

  static Widget customeLoadingwidget({required double size}) {
    return Center(
      child: LoadingAnimationWidget.beat(
        color: Color(0xFF1A1A3F),
        size: size,
      ),
    );
  }

  static customeDialog(
      {required String left, required String right, required void onTap()}) {
    Get.defaultDialog(
        title: 'Confirm log out !',
        middleText: '',
        // titleStyle: AppFonts.f19w500.copyWith(color: Colors.black),
        cancel: TextButton(
            onPressed: () => Get.back(),
            child: Text(
              left,
              // style: AppFonts.f19w500.copyWith(color: Colors.red),
            )),
        confirm: TextButton(
            onPressed: onTap,
            child: Text(
              right,
              // style: AppFonts.f19w500.copyWith(color: Colors.green)
            )));
  }
}

import 'dart:developer';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/services/dio/apiService.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:permission_handler/permission_handler.dart';

class ImagePick {
  factory ImagePick() {
    return _instance;
  }
  const ImagePick._();
  static final ImagePick _instance = const ImagePick._();
  pickImage({required BuildContext context}) async {
    final status = await Permission.camera.request();
    if (status == PermissionStatus.denied) {
      Permission.camera.request();
    }
    try {
      Helper.customeLoadingSnac(title: 'Uploading User Image');

      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return await Apiservice()
            .uploadImage(path: image.path, context: context);
      }
    } on Exception catch (e) {
      final status = await Permission.photos.status;
      if (status == PermissionStatus.denied) {
        Permission.photos.request();
      }
    }
  }
}

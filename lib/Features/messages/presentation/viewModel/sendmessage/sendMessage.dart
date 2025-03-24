import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docdoc/Core/Utiles/shared_pref/prefs_Keys.dart';
import 'package:docdoc/Core/Utiles/shared_pref/shared_pref.dart';

class Sendmessage {
  static Future<void> sendMessage(
      {required String collection,
      required String message,
      required String drPic,
      required String DrName,
      required String DrGeneral,
      required String userId}) async {
    var userImage = await SharedPref().getString(PrefsKeys.userImage);

    CollectionReference user =
        FirebaseFirestore.instance.collection(collection);
    await user.add({
      'userImage': userImage,
      'DrPic': drPic,
      'DrName': DrName,
      'DrGeneral': DrGeneral,
      'isRead': false,
      'message': message,
      'userId': userId,
      'time':
          "${DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().hour > 12 ? 'PM' : 'AM'}"
    });
  }
}

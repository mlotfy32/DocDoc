import 'package:docdoc/Core/Utiles/AppImages/appImages.dart';
import 'package:docdoc/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Customeauthrow extends StatelessWidget {
  const Customeauthrow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: Get.size.width,
      child: ListView.builder(
        padding: EdgeInsets.only(
            left: language == 'en' || language == null ? 65.w : 0,
            right: language == 'ar' ? 65.w : 0),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: InkWell(
            onTap: () {
              _signInWithGoogle();
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xffF5F5F5),
              child: SvgPicture.asset(AppImages.authList[index]),
            ),
          ),
        ),
      ),
    );
  }
}

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

Future<void> _signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    debugPrint('User: ${googleUser.displayName}');
    debugPrint('Email: ${googleUser.email}');
  } catch (error) {
    debugPrint('Error signing in with Google: $error');
  }
}

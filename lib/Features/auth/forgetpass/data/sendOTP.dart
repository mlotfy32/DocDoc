import 'dart:convert';
import 'dart:math';
import 'package:docdoc/Core/Utiles/appCurves.dart';
import 'package:docdoc/Core/Utiles/constans.dart';
import 'package:docdoc/Core/Utiles/env_variables.dart';
import 'package:docdoc/Core/Utiles/helper.dart';
import 'package:docdoc/Core/Utiles/language/lang_keys.dart';
import 'package:docdoc/Features/auth/forgetpass/presentation/view/widgets/otpVerification.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Sendotp {
  factory Sendotp() {
    return otp;
  }

  Sendotp._internal();
  static final Sendotp otp = Sendotp._internal();

  Future<void> sendEmailWithSendGrid(
      {required String email, required int randomNumber}) async {
    final url = Uri.parse(EnvVariable.instance.emailURL);

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${Constans.emailApiKey}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'personalizations': [
          {
            'to': [
              {'email': '$email'}
            ],
          }
        ],
        'from': {'email': 'mhmdlotfy12200@gmail.com'},
        'subject': 'OTP',
        'content': [
          {
            'type': 'text/plain',
            'value': '$randomNumber : رقم التحقق الخاص بك هو ',
          }
        ],
      }),
    );

    if (response.statusCode == 202) {
      Helper.FlutterToast(title: LangKeys.emailSendSucc.tr, success: true);
    } else {
      Helper.FlutterToast(title: LangKeys.sendEmailFailed.tr, success: false);
    }
  }

  int generateRandomNumber(int numberOfDigits) {
    if (numberOfDigits < 1) {
      throw ArgumentError('Number of digits must be at least 1');
    }

    Random random = Random();
    int min = pow(10, numberOfDigits - 1).toInt();
    int max = pow(10, numberOfDigits).toInt() - 1;

    return min + random.nextInt(max - min + 1);
  }
}

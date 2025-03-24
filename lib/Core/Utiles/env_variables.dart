import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, prod }

class EnvVariable {
  EnvVariable._();
  //singltone pattern
  static final EnvVariable instance = EnvVariable._();
  String _envType = '';
  String _emailUrl = '';
  String _notificationBaseUrl = '';
  String _gitHup = '';

  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');
        break;
      case EnvTypeEnum.prod:
        await dotenv.load(fileName: '.env.prod');
        break;
    }
    //get the environment type
    _envType = dotenv.get('ENV_TYPE');
    _emailUrl = dotenv.get('EMAIL_URL');
    _notificationBaseUrl = dotenv.get('NOTIFICATION_BASE_URL');
    _gitHup = dotenv.get('GITHUP_URL');
  }

  //return the environment type
  bool get debugMode => _envType == 'dev';
  String get emailURL => _emailUrl;
  String get notificationBaseUrl => _notificationBaseUrl;
  String get gitHup => _gitHup;
}

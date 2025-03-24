import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  factory SharedPref() {
    return preferences;
  }

  SharedPref._internal();
  static final SharedPref preferences = SharedPref._internal();

  static late SharedPreferences sharedPreferences;

  Future<dynamic> instantiatePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences getPreferenceInstance() {
    return sharedPreferences;
  }

  Future<dynamic> setString(String key, String stringValue) async {
    await sharedPreferences.setString(key, stringValue);
  }

  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  Future<dynamic> setBoolean(String key, bool booleanValue) async {
    await sharedPreferences.setBool(key, booleanValue);
  }

  bool? getBoolean(String key) {
    return sharedPreferences.getBool(key);
  }

  Future<dynamic> setDouble(String key, double doubleValue) async {
    await sharedPreferences.setDouble(key, doubleValue);
  }

  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  Future<dynamic> setInt(String key, int intValue) async {
    await sharedPreferences.setInt(key, intValue);
  }

  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  Future<dynamic> removePreference(String key) async {
    await sharedPreferences.remove(key);
  }

  bool containPreference(String key) {
    if (sharedPreferences.get(key) == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<dynamic> clearPreferences() async {
    await sharedPreferences.clear();
  }
}

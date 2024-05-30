import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String getId() => prefs.getString("id") ?? "";

  static Future<void> setLogin(String id) async {
    await prefs.setBool("isLogin", true);
    await prefs.setString("id", id);
  }

  static bool isLogin() => prefs.getBool("isLogin") ?? false;

  // Todo Functions
}

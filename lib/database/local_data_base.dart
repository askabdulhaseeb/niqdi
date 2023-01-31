import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  static late SharedPreferences? _preferences;
  static Future<void> init() async =>
      _preferences = await SharedPreferences.getInstance();

  static void signout() => _preferences!.clear();

  static const String _isLogin = 'isLoginKey';

  //s
  // Setters
  //
  static Future<void> setIsLogin(bool value) async =>
      _preferences!.setBool(_isLogin, value);

  //
  // Getters
  //
  static bool get getIsLogin => _preferences!.getBool(_isLogin) ?? false;
}

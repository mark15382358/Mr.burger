import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static const String _tokenKey = "auth_token";
  static Future<void> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_tokenKey);
  }

  static Future<void> clearToken(String s) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(_tokenKey);
  }
}

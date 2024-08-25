import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String _keyTheme = 'theme';
  static const String _keyLocale = 'locale';

  static Future<void> setTheme(bool isDarkMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyTheme, isDarkMode);
  }

  static Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyTheme) ?? false; // Default is light mode (false)
  }

  static Future<void> setLocale(String locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLocale, locale);
  }

  static Future<String?> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLocale);
  }
}

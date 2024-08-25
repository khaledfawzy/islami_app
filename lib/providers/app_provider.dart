import 'package:flutter/material.dart';
import 'package:islami_friday_c9/ui/utils/preferences_func.dart'; // Update with the correct path to your PreferencesHelper

class AppProvider extends ChangeNotifier {
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;

  AppProvider() {
    _loadPreferences();
  }

  void setCurrentLocale(String newLocale) {
    currentLocale = newLocale;
    PreferencesHelper.setLocale(newLocale);  // Save the new locale
    notifyListeners();
  }

  void setCurrentThemeMode(ThemeMode newTheme) {
    currentMode = newTheme;
    PreferencesHelper.setTheme(newTheme == ThemeMode.dark);  // Save the new theme mode
    notifyListeners();
  }

  Future<void> _loadPreferences() async {
    currentLocale = await PreferencesHelper.getLocale() ?? "en";
    bool isDarkMode = await PreferencesHelper.getTheme();
    currentMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

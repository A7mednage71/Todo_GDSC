import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppProvider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.system;
  String language = 'en';

  void changeTheme(ThemeMode newTheme) async {
    if (newTheme == theme) {
      return;
    }
    theme = newTheme;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'theme',
      newTheme == ThemeMode.dark
          ? 'dark'
          : newTheme == ThemeMode.system
          ? 'system'
          : 'light',
    );
    notifyListeners();
  }

  void changeLanguage(String newLanguage) async {
    if (newLanguage == language) {
      return;
    }
    language = newLanguage;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', newLanguage);
    notifyListeners();
  }
}

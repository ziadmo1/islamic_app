import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String localeLang = 'en';
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) async {
    if (newTheme == themeMode) {
      return;
    }
    themeMode = newTheme;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', newTheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  void changeLanguage(String newLang) async {
    if (newLang == localeLang) {
      return;
    }
    localeLang = newLang;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', newLang);

    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{

  String localeLang = 'en';
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode newTheme){
    if(newTheme == themeMode){
      return;
    }
    themeMode = newTheme;
    notifyListeners();
  }

  void changeLanguage(String newLang){
    if(newLang == localeLang){
      return;
    }
    localeLang = newLang;
    notifyListeners();
  }

}
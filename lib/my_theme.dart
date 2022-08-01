import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightOrange = Color(0xFFB7935F);
  static const Color lightYellow = Color(0xFFFACC1D);
  static const Color navyColor = Color(0xFF141A2E);


  static final ThemeData lightTheme = ThemeData(
    backgroundColor: lightOrange,
    primaryColor: lightOrange,
      dividerColor: lightOrange,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
        displayMedium: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        labelMedium:  TextStyle(
            fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 35)),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: Colors.black,
          )));
  static final ThemeData darkTheme = ThemeData(
      backgroundColor: navyColor,
      primaryColor: navyColor,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
        displayMedium: TextStyle(
            fontSize: 20, color: lightYellow, fontWeight: FontWeight.bold),
        labelMedium:  TextStyle(
            fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      dividerColor: lightYellow,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: lightYellow,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 32)),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: Colors.white,
          )));
}

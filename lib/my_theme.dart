import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightOrange = Color(0xFFB7935F);
  static final ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
        bodyMedium: TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
        displayMedium: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 32)),
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
}

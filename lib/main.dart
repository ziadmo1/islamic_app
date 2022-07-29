import 'package:flutter/material.dart';
import 'package:islamic_app/home_page.dart';
import 'package:islamic_app/home_screen/hadeth_tab/hadeth_tab_details.dart';
import 'package:islamic_app/home_screen/quran_tab/quran_tab_details.dart';
import 'package:islamic_app/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        QuranDetails.routeName: (_) => QuranDetails(),
        HadethTabDetails.routeName: (_) => HadethTabDetails()
      },
      theme: MyThemeData.lightTheme,
    );
  }
}

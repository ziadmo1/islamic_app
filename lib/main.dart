import 'package:flutter/material.dart';
import 'package:islamic_app/home_screen/hadeth_tab/hadeth_tab_details.dart';
import 'package:islamic_app/home_screen/home_page.dart';
import 'package:islamic_app/home_screen/quran_tab/quran_tab_details.dart';
import 'package:islamic_app/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context)=>AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Spanish, no country code
      ],
      locale: Locale(provider.localeLang),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        QuranDetails.routeName: (_) => QuranDetails(),
        HadethTabDetails.routeName: (_) => HadethTabDetails()
      },
      themeMode: provider.themeMode,
      darkTheme: MyThemeData.darkTheme,
      theme: MyThemeData.lightTheme,
    );
  }
}

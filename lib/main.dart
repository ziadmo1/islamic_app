import 'package:flutter/material.dart';
import 'package:islamic_app/home_screen/hadeth_tab/hadeth_tab_details.dart';
import 'package:islamic_app/home_screen/home_page.dart';
import 'package:islamic_app/home_screen/quran_tab/quran_tab_details.dart';
import 'package:islamic_app/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

late AppConfigProvider provider;
void changePref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  provider.changeLanguage(prefs.getString('lang') ?? 'en');
  if (prefs.getString('theme') == 'light') {
    provider.changeTheme(ThemeMode.light);
  } else if (prefs.getString('theme') == 'dark') {
    provider.changeTheme(ThemeMode.dark);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    changePref();
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

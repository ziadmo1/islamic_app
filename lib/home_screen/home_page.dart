import 'package:flutter/material.dart';
import 'package:islamic_app/home_screen/hadeth_tab/hadeth_tab.dart';
import 'package:islamic_app/home_screen/quran_tab/quran_tab.dart';
import 'package:islamic_app/home_screen/radio_tab/radio_tab.dart';
import 'package:islamic_app/home_screen/sebha_tab/sebha_tab.dart';
import 'package:islamic_app/home_screen/setting_tab/setting_tab.dart';
import 'package:islamic_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> screens = [
    QuaranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingTab()
  ];
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(provider.themeMode == ThemeMode.light
                  ? 'assets/images/back_ground.png'
                  : 'assets/images/back_ground_dark.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).backgroundColor,
                  icon: ImageIcon(AssetImage('assets/images/quran.png')),
                  label: AppLocalizations.of(context)!.quran_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).backgroundColor,
                  icon: ImageIcon(AssetImage('assets/images/hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).backgroundColor,
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                  label: AppLocalizations.of(context)!.sebha_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).backgroundColor,
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),
                  label: AppLocalizations.of(context)!.radio_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).backgroundColor,
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting_title),
            ],
          ),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}

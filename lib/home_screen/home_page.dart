import 'package:flutter/material.dart';
import 'package:islamic_app/home_screen/hadeth_tab/hadeth_tab.dart';
import 'package:islamic_app/home_screen/quran_tab/quran_tab.dart';
import 'package:islamic_app/home_screen/radio_tab/radio_tab.dart';
import 'package:islamic_app/home_screen/sebha_tab/sebha_tab.dart';
import 'package:islamic_app/my_theme.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> screens = [QuaranTab(), HadethTab(), SebhaTab(), RadioTab()];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/back_ground.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Islamic'),
        ),
        bottomNavigationBar: Theme(
          data:
              Theme.of(context).copyWith(canvasColor: MyThemeData.lightOrange),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/quran.png')),
                  label: 'Quran'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/hadeth.png')),
                  label: 'Hadeth'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                  label: 'Sebha'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),
                  label: 'Radio')
            ],
          ),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}

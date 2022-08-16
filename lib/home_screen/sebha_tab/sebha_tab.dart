import 'package:flutter/material.dart';
import 'package:islamic_app/providers/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotate = 0;
  int counter = 0;
  List<String> onSebha = [
    'سبحان الله',
    'الحمدلله',
    'لا اله الا الله',
    'الله أكبر'
  ];
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            alignment: Alignment(0.2, -2.2),
            children: [
              provider.themeMode == ThemeMode.light
                  ? Image.asset('assets/images/head_sebha.png')
                  : Image.asset('assets/images/head_sebha_dark.png'),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  rotate++;
                  counter++;
                  onClickSebha();
                  setState(() {});
                },
                child: Transform.rotate(
                    angle: rotate,
                    child: provider.themeMode == ThemeMode.light
                        ? Image.asset('assets/images/body_sebha.png')
                        : Image.asset('assets/images/body_sebha_dark.png')),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          AppLocalizations.of(context)!.tasbeh,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
            alignment: Alignment.center,
            width: 50,
            height: 60,
            decoration: BoxDecoration(
                color: provider.themeMode == ThemeMode.light
                    ? Color(0xCCC6B088)
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12)),
            child: Text(counter.toString())),
        SizedBox(
          height: 25,
        ),
        Container(
            alignment: Alignment.center,
            width: 150,
            height: 50,
            decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              '${onSebha[index]}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: provider.themeMode == ThemeMode.light
                      ? Colors.white
                      : Colors.black),
            )),
      ],
    );
  }

  int index = 0;
  void onClickSebha() {
    if (index == 0 && counter >= 0) {
      onSebha[0];
      if (counter >= 34) {
        counter = 0;
        index++;
      }
    } else if (index == 1 && counter >= 0) {
      onSebha[1];
      if (counter >= 34) {
        counter = 0;
        index++;
      }
    } else if (index == 2 && counter >= 0) {
      onSebha[2];
      if (counter >= 34) {
        counter = 0;
        index++;
      }
    } else if (index == 3 && counter >= 0) {
      onSebha[3];
      if (counter >= 2) {
        counter = 0;
        index = 0;
      }
    }
  }
}

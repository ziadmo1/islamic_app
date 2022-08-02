import 'package:flutter/material.dart';
import 'package:islamic_app/providers/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            InkWell(
                onTap: () async {
                  provider.changeTheme(ThemeMode.light);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('isDark', false);
                },
                child: provider.themeMode == ThemeMode.light
                    ? getSelectedLang(AppLocalizations.of(context)!.light)
                    : getUnSelectedLang(AppLocalizations.of(context)!.light)),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () async {
                  provider.changeTheme(ThemeMode.dark);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('isDark', true);
                },
                child: provider.themeMode == ThemeMode.dark
                    ? getSelectedLang(AppLocalizations.of(context)!.dark)
                    : getUnSelectedLang(AppLocalizations.of(context)!.dark))
          ],
        ),
      ),
    );
  }

  Widget getSelectedLang(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.yellowAccent,
          ),
        ),
        Icon(
          Icons.check,
          color: Colors.yellowAccent,
        ),
      ],
    );
  }

  Widget getUnSelectedLang(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

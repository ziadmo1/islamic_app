import 'package:flutter/material.dart';
import 'package:islamic_app/providers/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LangBottomSheet extends StatelessWidget {
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
                onTap: () {
                  provider.changeLanguage('en');
                },
                child: provider.localeLang == 'en'
                    ? getSelectedLang(AppLocalizations.of(context)!.english)
                    : getUnSelectedLang(AppLocalizations.of(context)!.english)),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  provider.changeLanguage('ar');
                },
                child: provider.localeLang == 'ar'
                    ? getSelectedLang(AppLocalizations.of(context)!.arabic)
                    : getUnSelectedLang(AppLocalizations.of(context)!.arabic))
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

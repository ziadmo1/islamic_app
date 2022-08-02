import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamic_app/home_screen/hadeth_tab/hadeth_details_design.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/provider.dart';
import 'package:provider/provider.dart';

class HadethTabDetails extends StatelessWidget {
  static const String routeName = 'hadethTab';

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    HadethContent hadethContent =
        ModalRoute.of(context)?.settings.arguments as HadethContent;
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
            body: Container(
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 18),
                decoration: BoxDecoration(
                    color: provider.themeMode == ThemeMode.light
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${hadethContent.title}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(
                            width: 1, color: Theme.of(context).dividerColor))),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) =>
                        hadethContent.content.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              ))
                            : HadethDetailsDesign(hadethContent.content),
                    itemCount: hadethContent.content.length,
                  )),
                ]))));
  }
}

class HadethContent {
  String title;
  List<String> content;

  HadethContent({
    required this.title,
    required this.content,
  });
}

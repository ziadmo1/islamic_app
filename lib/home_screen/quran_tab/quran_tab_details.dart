import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/home_screen/quran_tab/quran_details_design.dart';
import 'package:islamic_app/providers/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class QuranDetails extends StatefulWidget {
  static const String routeName = 'quran';

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    SuraNameArgu suraName =
        ModalRoute.of(context)?.settings.arguments as SuraNameArgu;
    if (verses.isEmpty) readFile(suraName.index);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(provider.themeMode == ThemeMode.light?
              'assets/images/back_ground.png':
              'assets/images/back_ground_dark.png'
              ))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 18),
          decoration: BoxDecoration(
              color:provider.themeMode == ThemeMode.light? Colors.white : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'سورة ${suraName.suraName}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                    radius: 14,
                    backgroundColor: Theme.of(context).dividerColor,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 12,
                          color: Colors.white,
                        )))
              ],
            ),
            Container(
              width: 250,
              decoration:  BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(width: 1, color: Theme.of(context).dividerColor))),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Theme.of(context).dividerColor,
                      ))
                    : QuranDetailsDesign(verses[index], index),
                itemCount: verses.length,
              ),
            )
          ]),
        ),
      ),
    );
  }

  List<String> verses = [];

  void readFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.trim().split('\r\n');
    verses = lines;
    setState(() {});
  }
}

class SuraNameArgu {
  int index;
  String suraName;
  SuraNameArgu(this.index, this.suraName);
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/home_screen/quran_tab/quran_details_design.dart';
import 'package:islamic_app/my_theme.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = 'quran';

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  @override
  Widget build(BuildContext context) {
    SuraNameArgu suraName =
        ModalRoute.of(context)?.settings.arguments as SuraNameArgu;
    if (verses.isEmpty) readFile(suraName.index);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/back_ground.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Islamic'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 18),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                    backgroundColor: Colors.black,
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
              decoration: const BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(width: 1, color: MyThemeData.lightOrange))),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: MyThemeData.lightOrange,
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

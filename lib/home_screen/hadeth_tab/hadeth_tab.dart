import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/home_screen/hadeth_tab/hadeth_tab_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<AllHadethContent> allHadeths = [];
  @override
  Widget build(BuildContext context) {
    if (allHadeths.isEmpty) readFile();
    return Column(
      children: [
        Center(
          child: Image.asset('assets/images/hadeth_logo.png'),
        ),
        Divider(
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadethTabDetails.routeName,
                    arguments: HadethContent(
                      title: allHadeths[index].title,
                      content: allHadeths[index].content,
                    ));
              },
              child: Text(
                allHadeths[index].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            separatorBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Divider(
                  thickness: 3,
                )),
            itemCount: allHadeths.length,
          ),
        ),
      ],
    );
  }

  void readFile() async {
    String content = await rootBundle.loadString('assets/hadeth/ahadeth.txt');
    List<String> hadeths = content.trim().split('#\r\n');
    for (int i = 0; i < hadeths.length; i++) {
      String hadeth = hadeths[i];
      List<String> lines = hadeth.trim().split('\r\n');
      String titleHadeth = lines[0];
      lines.removeAt(0);
      List<String> content = lines;
      AllHadethContent(titleHadeth, content);
      allHadeths.add(AllHadethContent(titleHadeth, content));
    }
    setState(() {});
  }
}

class AllHadethContent {
  String title;
  List<String> content;
  AllHadethContent(this.title, this.content);
}

import 'package:flutter/material.dart';
import 'package:islamic_app/home_screen/hadeth_tab/hadeth_details_design.dart';
import 'package:islamic_app/home_screen/hadeth_tab/hadeth_tab.dart';
import 'package:islamic_app/my_theme.dart';

class HadethTabDetails extends StatelessWidget {
  static const String routeName = 'hadethTab';

  @override
  Widget build(BuildContext context) {
    HadethContent hadethContent =
        ModalRoute.of(context)?.settings.arguments as HadethContent;
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
                    color: Colors.white,
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
                            width: 1, color: MyThemeData.lightOrange))),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) =>
                        hadethContent.content.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(
                                color: MyThemeData.lightOrange,
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

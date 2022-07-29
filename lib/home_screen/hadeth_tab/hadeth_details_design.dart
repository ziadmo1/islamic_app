import 'package:flutter/material.dart';

class HadethDetailsDesign extends StatelessWidget {
  List<String> text;
  HadethDetailsDesign(
    this.text,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        '$text',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium,
      )),
    );
  }
}

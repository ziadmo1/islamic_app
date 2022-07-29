import 'package:flutter/material.dart';

class QuranDetailsDesign extends StatelessWidget {
  String text;
  int index;
  QuranDetailsDesign(this.text, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        '$text(${index + 1})',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium,
      )),
    );
  }
}

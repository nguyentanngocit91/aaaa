import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  TitleHeader(
      {Key? key,
        required this.stringTitle,
        this.colorTitle = Colors.white,
        this.fontSize = 15})
      : super(key: key);
  final String stringTitle;
  final Color colorTitle;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        stringTitle,
        style: TextStyle(color: colorTitle, fontSize: fontSize),
      ),
    );
  }
}
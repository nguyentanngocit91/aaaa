import 'package:flutter/material.dart';
class RichTextInfo extends StatelessWidget {
  const RichTextInfo({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
      text: '$title: ',
        style: const TextStyle(fontWeight: FontWeight.bold),
    ),
      TextSpan(text: content),
        ],)
    );
  }
}
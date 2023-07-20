import 'package:flutter/material.dart';

class PtButton extends StatelessWidget {
  const PtButton({
    super.key, required this.title, required this.icon, this.onPressed,
  });
  final String title;
  final Icon icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10)
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 5,),
            Text(title),
          ],
        ));
  }
}
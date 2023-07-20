import 'package:flutter/material.dart';

class PtButton extends StatelessWidget {
  const PtButton({
    super.key, required this.title, required this.icon, this.onPressed, this.width=120
  });
  final String title;
  final Icon icon;
  final double width;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:this.width,
      child:ElevatedButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(10)
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 5,),
              Text(title),
            ],
          )),
    );
  }
}
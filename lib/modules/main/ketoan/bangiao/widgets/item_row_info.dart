import 'package:flutter/material.dart';

class ItemRowInfo extends StatelessWidget {
  const ItemRowInfo(
      {super.key,
      required this.child,
      this.colorBG = Colors.transparent,
      this.lastColum = false,
      this.lastRow = false});
  final Widget child;
  final Color colorBG;
  final bool lastColum;
  final bool lastRow;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: colorBG,
          border: Border(
            right: (!lastColum)
                ? const BorderSide(
                    color: Color(0xFFCCCCCC),
                  )
                : BorderSide.none,
            bottom: (!lastRow)
                ? const BorderSide(
                    color: Color(0xFFCCCCCC),
                  )
                : BorderSide.none,
          )),
      child: child,
    );
  }
}

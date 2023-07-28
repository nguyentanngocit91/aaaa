import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../_shared/thietlap_ngonngu.dart';

class Helper {
  static padding(){
    return EdgeInsets.all(5);
  }
  InputDecoration disabledInput(){
    return  InputDecoration(
      filled: true, //<-- SEE HERE
      fillColor: Colors.black12, //<-- SEE HERE
    );
  }
  static String convertName(Key? key) {
    String strReturn = key.toString();
    strReturn = strReturn.replaceAll("[<'", "");
    strReturn = strReturn.replaceAll("'>]", "");
    return strReturn;
  }


  static dateFormat(var data){
    DateTime date = DateTime.parse(data.toString());
    return  "${date.day}-${date.month}-${date.year}";
  }

  static print2(json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(json);
    print(prettyprint);
  }

  static String numberFormat(double num) {
    var numFormat = NumberFormat.currency(locale: "vi_VN", symbol: "đ");
    return numFormat.format(num);
  }

  static Future<DateTime?> onSelectDate(BuildContext context,
      {bool Function(DateTime)? selectableDayPredicate,
      DateTime? initialDate,
      DateTime? firstDate}) async {
    final now = DateTime.now();
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      selectableDayPredicate: selectableDayPredicate,
      firstDate: firstDate ?? DateTime(now.year - 2),
      lastDate: DateTime(now.year + 5),
    );
  }

  static parseDate(String text, String s) {
    final f = new DateFormat(s);
    return f.parse(text);
  }
}

class Loading {
  late BuildContext context;

  Loading(this.context);

  Future<void> start() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context2) {
        return Dialog(
          elevation: 0.0,
          backgroundColor:
              Colors.transparent, // can change this to your prefered color
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // The loading indicator
                const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  ngonngu(context2).vuilongdoi,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> stop() async {
    context.pop();
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../_shared/thietlap_ngonngu.dart';
enum loadingStatus {NONE,START,STOP}
class Helper {
  static toast({required String messenge,required BuildContext context}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message:messenge,
      ),
    );
  }
  static padding(){
    return const EdgeInsets.only(left:10.0,right:10.0,top:7.0,bottom:7.0);
  }
  InputDecoration disabledInput(){
    return  InputDecoration(
      filled: true,
      fillColor: Colors.black12,
    );
  }
  static String convertName(Key? key) {
    String strReturn = key.toString();
    strReturn = strReturn.replaceAll("[<'", "");
    strReturn = strReturn.replaceAll("'>]", "");
    return strReturn;
  }


  static dateFormat(var data){
    if(data!=null) {
      DateTime date = DateTime.parse(data.toString());
      return "${date.day}-${date.month}-${date.year}";
    }
    return '';
  }

  static print2(json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(json);
    print(prettyprint);
  }

  static String numberFormat(double num, {String? symbol = "đ"}) {
    var numFormat = NumberFormat.currency(locale: "vi_VN", symbol: symbol);
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
    if(text=="")
      return null;
    final f = new DateFormat(s);
    return f.parse(text);
  }

  static saveDate(value) {
    return DateFormat("yyyy-MM-dd").format(DateFormat('dd-MM-yyyy').parse(value));
  }

  static String convertMBtoGB(double megabytes) {
    double gigabytes = megabytes / 1000;
    return gigabytes.toStringAsFixed(0);
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

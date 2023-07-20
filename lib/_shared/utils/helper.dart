import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../_shared/thietlap_ngonngu.dart';

class Helper {
  static String convertName(Key? key) {
    String strReturn = key.toString();
    strReturn = strReturn.replaceAll("[<'", "");
    strReturn = strReturn.replaceAll("'>]", "");
    return strReturn;
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
                const CircularProgressIndicator.adaptive(backgroundColor: Colors.white,),
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
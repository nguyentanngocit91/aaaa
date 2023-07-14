import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../_shared/thietlap_dieuhuong.dart';
import '../../_shared/thietlap_ngonngu.dart';
import '../../core/utils/ndgap.dart';

class ErrorNoInternetLayout extends StatefulWidget {
  const ErrorNoInternetLayout({Key? key}) : super(key: const Key(pathName));
  static const String pathName = 'errorNoInternet';

  @override
  State<ErrorNoInternetLayout> createState() => _ErrorNoInternetLayoutState();
}

class _ErrorNoInternetLayoutState extends State<ErrorNoInternetLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.signal_wifi_statusbar_connected_no_internet_4_outlined,
                size: 128,
              ),
              ndGapH8(),
              Text(
                ngonngu(context).nointernet_str_title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              ndGapH4(),
              Text(
                ngonngu(context).nointernet_str_message,
                textAlign: TextAlign.center,
              ),
              ndGapH48(),
              ElevatedButton(
                  onPressed: () {
                    context.go(pathSplash);
                  },
                  child: Text(ngonngu(context).nointernet_str_btn)),
            ],
          ),
        ),
      ),
    );
  }
}

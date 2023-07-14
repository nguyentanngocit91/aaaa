import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../_shared/thietlap_dieuhuong.dart';
import '../../_shared/thietlap_ngonngu.dart';
import '../../core/utils/ndgap.dart';

class Error404Layout extends StatefulWidget {
  const Error404Layout({Key? key}) : super(key: const Key(pathName));
  static const String pathName = 'error404';

  @override
  State<Error404Layout> createState() => _Error404LayoutState();
}

class _Error404LayoutState extends State<Error404Layout> {
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
                Icons.warning_amber_outlined,
                size: 128,
              ),
              ndGapH8(),
              Text(
                ngonngu(context).error404_str_title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              ndGapH48(),
              ElevatedButton(
                  onPressed: () {
                    context.go(pathSplash);
                  },
                  child: Text(ngonngu(context).error404_str_btn)),
            ],
          ),
        ),
      ),
    );
  }
}

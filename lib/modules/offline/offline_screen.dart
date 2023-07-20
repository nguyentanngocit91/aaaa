import 'dart:io';

import 'package:flutter/material.dart';

import '../../_shared/utils/ndgap.dart';

class OfflineScreen extends StatefulWidget {
  const OfflineScreen({Key? key}) : super(key: const Key(pathName));
  static const String pathName = 'offline';
  @override
  State<OfflineScreen> createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/bg_offline.png'),
              ndGapH8(),
              const Text(
                'Hệ thống đang nâng cấp\nVui lòng truy cập lại sau!',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.red),
                textAlign: TextAlign.center,
              ),
              ndGapH48(),
              ElevatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text('THOÁT')),
            ],
          ),
        ),
      ),
    );
  }
}

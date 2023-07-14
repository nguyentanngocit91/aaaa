import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardLayout extends ConsumerWidget {
  const DashboardLayout() : super(key: const Key(pathName));

  static const String pathName = 'dashboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Text('Đây là trang dashboard'));
  }
}

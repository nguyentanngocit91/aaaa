import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/danh_sach_layout.dart';

class DanhSachMoiPendingLayout extends ConsumerWidget {
  const DanhSachMoiPendingLayout({Key? key}) : super(key: const Key(pathName));

  static const pathName = 'danh-sach-moi-cap-nhat-va-pending';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DanhSachLayout();
  }
}

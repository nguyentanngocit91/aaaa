import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SuaPhieuThuLayout extends ConsumerStatefulWidget {
  const SuaPhieuThuLayout() : super(key: const Key(nameRoute));

  static const String nameRoute = 'sua-phieu-thu';
  static const String pathRoute = ':id';

  @override
  ConsumerState createState() => _SuaPhieuThuLayoutLayoutState();
}

class _SuaPhieuThuLayoutLayoutState extends ConsumerState<SuaPhieuThuLayout> {
  @override
  Widget build(BuildContext context) {
    print(GoRouterState.of(context).pathParameters);
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../_shared/thietlap_dieuhuong.dart';
import 'app_router_notifier.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: _key,
    refreshListenable: notifier,
    errorBuilder: (context, state) => routeError,
    debugLogDiagnostics: isDebugRoute,
    initialLocation: routeMacDinh,
    routes: danhsachRoute,
    redirect: notifier.redirect,
  );
});

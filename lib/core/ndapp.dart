import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../_shared/app_config/data_box.dart';
import '../_shared/thietlap_giaodien.dart';
import '../_shared/thietlap_ngonngu.dart';
import 'router/app_router.dart';

class NDApp extends ConsumerWidget {
  const NDApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final chedosangtoi = ref.watch(darkModeProvider);
    final ngonngumacdinh = ref.watch(languageProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: NDSharedLanguage().localeDelegate,
      supportedLocales: NDSharedLanguage().supportedLocales,
      locale: Locale(ngonngumacdinh!),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: chedosangtoi,
      routerConfig: router,
    );
  }
}

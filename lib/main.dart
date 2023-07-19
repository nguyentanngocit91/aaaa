import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_ui/responsive_ui.dart';

import '_shared/app_config/app.dart';
import 'core/ndapp.dart';
Future<void> main() async {
  Responsive.setGlobalBreakPoints(0, 596.0, 897.0, 1232.0);
  WidgetsFlutterBinding.ensureInitialized();
  await App.setup();
  runApp(
    UncontrolledProviderScope(
      container: App.providerContainer,
      child: const NDApp(),
    ),
  );
}
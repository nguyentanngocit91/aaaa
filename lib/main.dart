import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '_shared/app_config/app.dart';
import 'core/ndapp.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await App.setup();
  runApp(
    UncontrolledProviderScope(
      container: App.providerContainer,
      child: const NDApp(),
    ),
  );
}
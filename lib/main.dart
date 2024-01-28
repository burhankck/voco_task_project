// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:reflectable/reflectable.dart';
import 'package:voco_task_project/app/voco_app.dart';

void main() async {
  // initializeReflectable();
  _ensureInitialized();
  _deviceOrientation();
  runApp(
    _buildIWalletApp(),
  );
}

VocoApp _buildIWalletApp() => const VocoApp();

WidgetsBinding _ensureInitialized() =>
    WidgetsFlutterBinding.ensureInitialized();

void _deviceOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

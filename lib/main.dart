// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:reflectable/reflectable.dart';
import 'package:voco_task_project/app/voco_app.dart';
import 'package:voco_task_project/main.reflectable.dart';
import 'package:voco_task_project/presentation/controller/login/login_auth_controller.dart';

void main() async {
  initializeReflectable();
  _ensureInitialized();
  _deviceOrientation();
  runApp(
    _buildProviderScope(),
  );
}

ProviderScope _buildProviderScope() => ProviderScope(
      child: _buildVocoApp(),
    );

VocoApp _buildVocoApp() => const VocoApp();

WidgetsBinding _ensureInitialized() =>
    WidgetsFlutterBinding.ensureInitialized();

void _deviceOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}


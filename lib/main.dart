// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:reflectable/reflectable.dart';
import 'package:voco_task_project/app/voco_app.dart';
import 'package:voco_task_project/data/resources/authantication/authantication_manager.dart';
import 'package:voco_task_project/main.reflectable.dart';
import 'package:voco_task_project/presentation/controller/login/login_auth_controller.dart';
import 'package:voco_task_project/presentation/controller/login/login_token_cache_controller.dart';
import 'package:voco_task_project/presentation/controller/user_list/user_list_controller.dart';

void main() async {
  initializeReflectable();
  _ensureInitialized();
  _deviceOrientation();
  runApp(
    _buildProviderScope(isAuth: await AuthManager.instance.isAuthController()),
  );
}



ProviderScope _buildProviderScope({required bool isAuth}) => ProviderScope(
      child: _buildVocoApp(isAuth: isAuth),
    );

VocoApp _buildVocoApp({required bool isAuth}) => VocoApp(
      isAuth: isAuth,
    );

WidgetsBinding _ensureInitialized() =>
    WidgetsFlutterBinding.ensureInitialized();

void _deviceOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
//Tum uygulamada erisim saglanmasi icin provide edildi.
final LoginProvider = StateProvider((ref) => LoginAuthStateController());
final UserListProvider =
    ChangeNotifierProvider((ref) => UserListStateController());

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voco_task_project/data/resources/route_manager/route_constant.dart';
import 'package:voco_task_project/data/resources/route_manager/route_manager.dart';
import 'package:voco_task_project/presentation/controller/login/login_auth_controller.dart';
import 'package:voco_task_project/presentation/controller/login/login_token_cache_controller.dart';
import 'package:voco_task_project/presentation/controller/user_list/user_list_controller.dart';

class VocoApp extends StatefulWidget {
  const VocoApp({super.key});

  @override
  State<VocoApp> createState() => _VocoAppState();
}

class _VocoAppState extends State<VocoApp>
    with TokenCacheManager, _AppProperties {
  final RouteManager routeManager = RouteManager();

  @override
  void initState() {
    _isAuthController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routeManager.getRoute,
        initialRoute: _getRoute(),
      ),
    );
  }

  Future<void> _isAuthController() async {
    isAuth = false;
    String? token = await getTokenFromStorage();
    if (token != null && token.isNotEmpty) {
      isAuth = true;
    } else {
      isAuth = false;
    }
  }

  String _getRoute() {
    if (isAuth) {
      return RouteConstant.homeRoute;
    } else {
      return RouteConstant.loginRoute;
    }
  }
}

//Tum uygulamada erisim saglanmasi icin provide edildi.
final LoginProvider = StateProvider((ref) => LoginAuthStateController());
final UserListProvider =
    ChangeNotifierProvider((ref) => UserListStateController());

mixin _AppProperties {
  bool isAuth = false;
}

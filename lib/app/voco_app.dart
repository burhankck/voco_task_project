// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:voco_task_project/data/resources/route_manager/route_constant.dart';
import 'package:voco_task_project/data/resources/route_manager/route_manager.dart';
import 'package:voco_task_project/presentation/controller/login/login_auth_controller.dart';
import 'package:voco_task_project/presentation/controller/login/login_token_cache_controller.dart';
import 'package:voco_task_project/presentation/controller/user_list/user_list_controller.dart';

class VocoApp extends StatefulWidget {
  const VocoApp({
    Key? key,
    required this.isAuth,
  }) : super(key: key);

  final bool isAuth;

  @override
  State<VocoApp> createState() => _VocoAppState();
}

class _VocoAppState extends State<VocoApp> with TokenCacheManager {
  final RouteManager routeManager = RouteManager();

  @override
  void initState() {
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
        initialRoute: _getRoute(isAuth: widget.isAuth),
      ),
    );
  }

  String _getRoute({required bool isAuth}) {
    if (isAuth) {
      return RouteConstant.homeRoute;
    } else {
      return RouteConstant.loginRoute;
    }
  }
}


// mixin _AppProperties {
//   bool isAuth = false;
// }

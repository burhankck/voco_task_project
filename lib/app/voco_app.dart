import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voco_task_project/data/resources/route_manager/route_constant.dart';
import 'package:voco_task_project/data/resources/route_manager/route_manager.dart';



class VocoApp extends StatefulWidget {
  const VocoApp({super.key});

  @override
  State<VocoApp> createState() => _VocoAppState();
}

class _VocoAppState extends State<VocoApp> {
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
        initialRoute: RouteConstant.loginRoute,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:voco_task_project/data/resources/route_manager/route_constant.dart';

import 'package:voco_task_project/presentation/view/home_page.dart';
import 'package:voco_task_project/presentation/view/login_page.dart';

class RouteManager {
  Route<dynamic> getRoute(RouteSettings routeSettings) {
    dynamic argument = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteConstant.userRoute:
        return MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        );

      case RouteConstant.userRoute:
        return MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        );

      default:
        return _unDefinedRoute();
    }
  }

  static Route<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No Route Found"),
        ),
        body: const Center(child: Text("No Route Found")),
      ),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}

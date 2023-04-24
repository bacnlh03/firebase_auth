import 'package:auth_feature/src/presentation/views/home_page.dart';
import 'package:flutter/material.dart';

import 'package:auth_feature/src/presentation/views/login_page.dart';
import 'package:auth_feature/src/presentation/views/register_page.dart';
import 'package:auth_feature/src/utils/constants/constants.dart';

class OnGenerateRoute {
  OnGenerateRoute._();

  static Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case Pages.loginPage:
        return _routeBuilder(const LoginPage());

      case Pages.registerPage:
        return _routeBuilder(const RegisterPage());

      case Pages.homePage:
        return _routeBuilder(const HomePage());

      default:
        return _routeBuilder(const NoPageFound());
    }
  }
}

dynamic _routeBuilder(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Page not found"),
      ),
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:finance_app/src/pages/splashscreen.dart';
import 'package:finance_app/src/pages/login.dart';
import 'package:finance_app/src/pages/register.dart';
import 'package:finance_app/src/pages/home.dart';
import 'package:finance_app/src/pages/form_login.dart';

class Router {
  static const initialPage = '/';
  static const loginPage = '/login-page';
  static const registerPage = '/register-page';
  static const homePage = '/home-page';
  static const formLogin = '/form-login';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.initialPage:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
      case Router.loginPage:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: settings,
        );
      case Router.registerPage:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
          settings: settings,
        );
      case Router.homePage:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: settings,
        );
      case Router.formLogin:
        return MaterialPageRoute(
          builder: (_) => FormLogin(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

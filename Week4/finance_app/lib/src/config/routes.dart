import 'package:finance_app/src/config/route_name.dart';
import 'package:finance_app/src/pages/login.dart';
import 'package:finance_app/src/pages/register.dart';
import 'package:finance_app/src/pages/splashscreen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return {
      RouteName.login: (_) => LoginPage(),
      RouteName.loginForm: (_) => LoginForm(),
      RouteName.register: (_) => RegisterPage(),
      RouteName.splashscreen: (_) => SplashScreen(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    // switch (pathElements[1]) {
    //   case "DetailPage":
    //     return CustomRoute<bool>(
    //         builder: (BuildContext context) => DetailPage(
    //               model: settings.arguments,
    //             ));
    //   case "DetailArtikel":
    //     return CustomRoute<bool>(
    //         builder: (BuildContext context) => DetailArtikel(
    //               artikel: settings.arguments,
    //             ));
    //   case "BookingJadwal":
    //     return CustomRoute<bool>(
    //         builder: (BuildContext context) => BookingJadwal(
    //               model: settings.arguments,
    //             ));
    // }
  }
}

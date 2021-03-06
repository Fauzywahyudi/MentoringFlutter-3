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
import 'package:finance_app/src/pages/onboarding.dart';
import 'package:finance_app/src/pages/detail_informasi.dart';
import 'package:finance_app/src/model/informasi.dart';
import 'package:finance_app/src/pages/detail_transaksi.dart';

class Router {
  static const initialPage = '/';
  static const loginPage = '/login-page';
  static const registerPage = '/register-page';
  static const homePage = '/home-page';
  static const formLogin = '/form-login';
  static const onBoardingPage = '/on-boarding-page';
  static const detailInformasi = '/detail-informasi';
  static const detailTransaksi = '/detail-transaksi';
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
      case Router.onBoardingPage:
        return MaterialPageRoute(
          builder: (_) => OnBoardingPage(),
          settings: settings,
        );
      case Router.detailInformasi:
        if (hasInvalidArgs<Informasi>(args, isRequired: true)) {
          return misTypedArgsRoute<Informasi>(args);
        }
        final typedArgs = args as Informasi;
        return MaterialPageRoute(
          builder: (_) => DetailInformasi(model: typedArgs),
          settings: settings,
        );
      case Router.detailTransaksi:
        if (hasInvalidArgs<DetailTransaksiArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<DetailTransaksiArguments>(args);
        }
        final typedArgs = args as DetailTransaksiArguments;
        return MaterialPageRoute(
          builder: (_) =>
              DetailTransaksi(tipe: typedArgs.tipe, value: typedArgs.value),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//DetailTransaksi arguments holder class
class DetailTransaksiArguments {
  final String tipe;
  final String value;
  DetailTransaksiArguments({@required this.tipe, @required this.value});
}

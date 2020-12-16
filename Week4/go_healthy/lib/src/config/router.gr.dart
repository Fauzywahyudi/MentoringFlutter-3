// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:go_healthy/src/pages/splashscreen.dart';
import 'package:go_healthy/src/pages/login.dart';
import 'package:go_healthy/src/pages/register.dart';
import 'package:go_healthy/src/pages/home.dart';
import 'package:go_healthy/src/pages/form_login.dart';
import 'package:go_healthy/src/pages/onboarding.dart';
import 'package:go_healthy/src/pages/detail_informasi.dart';
import 'package:go_healthy/src/model/tips.dart';
import 'package:go_healthy/src/pages/bmi/home.dart';
import 'package:go_healthy/src/pages/bmi/result.dart';
import 'package:go_healthy/src/pages/istilah/istilah.dart';
import 'package:go_healthy/src/pages/berita/berita_kesehatan.dart';
import 'package:go_healthy/src/pages/berita/detail_berita.dart';
import 'package:go_healthy/src/model/berita.dart';
import 'package:go_healthy/src/pages/admin/home_admin.dart';
import 'package:go_healthy/src/pages/tabs/info_tabs.dart';
import 'package:go_healthy/src/pages/berita/add_berita.dart';
import 'package:go_healthy/src/pages/berita/edit_berita.dart';

class Router {
  static const initialPage = '/';
  static const loginPage = '/login-page';
  static const registerPage = '/register-page';
  static const homePage = '/home-page';
  static const formLogin = '/form-login';
  static const onBoardingPage = '/on-boarding-page';
  static const detailInformasi = '/detail-informasi';
  static const homePageBMI = '/home-page-bm-i';
  static const resultBMI = '/result-bm-i';
  static const istilahKesehatan = '/istilah-kesehatan';
  static const beritaKesehatan = '/berita-kesehatan';
  static const detailBerita = '/detail-berita';
  static const homeAdmin = '/home-admin';
  static const infoTab = '/info-tab';
  static const addBerita = '/add-berita';
  static const editBerita = '/edit-berita';
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
        if (hasInvalidArgs<Tips>(args, isRequired: true)) {
          return misTypedArgsRoute<Tips>(args);
        }
        final typedArgs = args as Tips;
        return MaterialPageRoute(
          builder: (_) => DetailInformasi(model: typedArgs),
          settings: settings,
        );
      case Router.homePageBMI:
        return MaterialPageRoute(
          builder: (_) => HomePageBMI(),
          settings: settings,
        );
      case Router.resultBMI:
        if (hasInvalidArgs<ResultBMIArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ResultBMIArguments>(args);
        }
        final typedArgs = args as ResultBMIArguments;
        return MaterialPageRoute(
          builder: (_) => ResultBMI(
              isMale: typedArgs.isMale, bb: typedArgs.bb, tb: typedArgs.tb),
          settings: settings,
        );
      case Router.istilahKesehatan:
        if (hasInvalidArgs<bool>(args)) {
          return misTypedArgsRoute<bool>(args);
        }
        final typedArgs = args as bool ?? false;
        return MaterialPageRoute(
          builder: (_) => IstilahKesehatan(isAdmin: typedArgs),
          settings: settings,
        );
      case Router.beritaKesehatan:
        if (hasInvalidArgs<bool>(args)) {
          return misTypedArgsRoute<bool>(args);
        }
        final typedArgs = args as bool ?? false;
        return MaterialPageRoute(
          builder: (_) => BeritaKesehatan(isAdmin: typedArgs),
          settings: settings,
        );
      case Router.detailBerita:
        if (hasInvalidArgs<DetailBeritaArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<DetailBeritaArguments>(args);
        }
        final typedArgs = args as DetailBeritaArguments;
        return MaterialPageRoute(
          builder: (_) =>
              DetailBerita(model: typedArgs.model, isAdmin: typedArgs.isAdmin),
          settings: settings,
        );
      case Router.homeAdmin:
        return MaterialPageRoute(
          builder: (_) => HomeAdmin(),
          settings: settings,
        );
      case Router.infoTab:
        if (hasInvalidArgs<bool>(args)) {
          return misTypedArgsRoute<bool>(args);
        }
        final typedArgs = args as bool ?? false;
        return MaterialPageRoute(
          builder: (_) => InfoTab(isAdmin: typedArgs),
          settings: settings,
        );
      case Router.addBerita:
        return MaterialPageRoute(
          builder: (_) => AddBerita(),
          settings: settings,
        );
      case Router.editBerita:
        if (hasInvalidArgs<Berita>(args, isRequired: true)) {
          return misTypedArgsRoute<Berita>(args);
        }
        final typedArgs = args as Berita;
        return MaterialPageRoute(
          builder: (_) => EditBerita(model: typedArgs),
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

//ResultBMI arguments holder class
class ResultBMIArguments {
  final bool isMale;
  final double bb;
  final double tb;
  ResultBMIArguments(
      {@required this.isMale, @required this.bb, @required this.tb});
}

//DetailBerita arguments holder class
class DetailBeritaArguments {
  final Berita model;
  final bool isAdmin;
  DetailBeritaArguments({@required this.model, this.isAdmin = false});
}

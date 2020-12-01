import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route/transitions_builders.dart';
import 'package:finance_app/src/pages/home.dart';
import 'package:finance_app/src/pages/login.dart';
import 'package:finance_app/src/pages/register.dart';
import 'package:finance_app/src/pages/splashscreen.dart';

@autoRouter
class $Router {
  @initial
  SplashScreen initialPage;
  LoginPage loginPage;
  RegisterPage registerPage;
  HomePage homePage;
  LoginForm loginForm;
}

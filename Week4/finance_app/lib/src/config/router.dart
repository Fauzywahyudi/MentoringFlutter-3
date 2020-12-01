import 'package:auto_route/auto_route_annotations.dart';
import 'package:finance_app/src/pages/form_login.dart';
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
  FormLogin formLogin;
}

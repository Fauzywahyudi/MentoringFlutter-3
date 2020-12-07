import 'package:auto_route/auto_route_annotations.dart';
import 'package:go_healthy/src/pages/berita/berita_kesehatan.dart';
import 'package:go_healthy/src/pages/bmi/home.dart';
import 'package:go_healthy/src/pages/bmi/result.dart';
import 'package:go_healthy/src/pages/detail_informasi.dart';
import 'package:go_healthy/src/pages/detail_transaksi.dart';
import 'package:go_healthy/src/pages/form_login.dart';
import 'package:go_healthy/src/pages/home.dart';
import 'package:go_healthy/src/pages/berita/detail_berita.dart';
import 'package:go_healthy/src/pages/istilah/istilah.dart';
import 'package:go_healthy/src/pages/login.dart';
import 'package:go_healthy/src/pages/onboarding.dart';
import 'package:go_healthy/src/pages/register.dart';
import 'package:go_healthy/src/pages/splashscreen.dart';

@autoRouter
class $Router {
  @initial
  SplashScreen initialPage;
  LoginPage loginPage;
  RegisterPage registerPage;
  HomePage homePage;
  FormLogin formLogin;
  OnBoardingPage onBoardingPage;
  DetailInformasi detailInformasi;
  DetailTransaksi detailTransaksi;
  HomePageBMI homePageBMI;
  ResultBMI resultBMI;
  IstilahKesehatan istilahKesehatan;
  BeritaKesehatan beritaKesehatan;
  DetailBerita detailBerita;
}

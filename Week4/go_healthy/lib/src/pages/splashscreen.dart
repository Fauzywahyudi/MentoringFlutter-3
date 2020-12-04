import 'dart:async';
import 'package:go_healthy/src/config/router.gr.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:go_healthy/src/widget/logo.dart';
import 'package:go_healthy/src/widget/text.dart';
import 'package:flutter/material.dart';
// import 'package:marketplace/provider/shared_preference.dart';
// import 'package:marketplace/utils/name_route.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 4), () => _cekUser());
  }

  void _cekUser() async {
    DataShared dataShared = DataShared();
    int value = await dataShared.getValue();
    bool onBoarded = await dataShared.getOnboarding();
    if (onBoarded == null) {
      Router.navigator.pushReplacementNamed(Router.onBoardingPage);
    } else {
      if (value == null) {
        Router.navigator.pushReplacementNamed(Router.loginPage);
      } else {
        Router.navigator.pushReplacementNamed(Router.homePage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoApp(size: 220),
            SizedBox(height: 100),
            TextAppSplash(),
          ],
        ),
      ),
    );
  }
}

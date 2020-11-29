import 'dart:async';

import 'package:finance_app/src/config/route_name.dart';
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
    Timer(Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, RouteName.login));
  }

  // void _cekUser() async {
  //   DataShared dataShared = DataShared();
  //   int value = await dataShared.getValue();
  //   if (value == null) {
  //     Navigator.pushReplacementNamed(context, RouteName.signin);
  //   } else if (value == 1) {
  //     Navigator.pushReplacementNamed(context, RouteName.home);
  //   } else if (value == 2) {
  //     Navigator.pushReplacementNamed(context, RouteName.admin);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('SplashScreen')),
          ],
        ),
      ),
    );
  }
}

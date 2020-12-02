import 'package:finance_app/src/config/router.gr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      // home: OnBoardingPage(),
      initialRoute: Router.initialPage,
      onGenerateRoute: Router.onGenerateRoute,
      navigatorKey: Router.navigatorKey,
    );
  }
}

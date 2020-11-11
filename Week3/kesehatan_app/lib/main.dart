import 'package:flutter/material.dart';
import 'package:kesehatan_app/views/login.dart';
import 'package:kesehatan_app/views/register.dart';
import 'package:kesehatan_app/views/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kesehatan App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        Register.routeName: (context) => Register(),
        SplashScreen.routeName: (context) => SplashScreen(),
      },
    );
  }
}

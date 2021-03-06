import 'package:flutter/material.dart';
import 'package:task_week2/views/bangun_datar.dart';
import 'package:task_week2/views/hitung_umur.dart';
import 'package:task_week2/views/home.dart';
import 'package:task_week2/views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Week 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        LoginPage.routeName: (context) => LoginPage(),
        HitungUmur.routeName: (context) => HitungUmur(),
        BangunDatar.routeName: (context) => BangunDatar(),
      },
      initialRoute: LoginPage.routeName,
    );
  }
}

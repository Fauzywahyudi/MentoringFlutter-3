import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_week2/views/bangun_datar.dart';
import 'package:task_week2/views/hitung_umur.dart';
import 'package:task_week2/views/login.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.powerOff),
            tooltip: 'Logout',
            onPressed: () =>
                Navigator.pushReplacementNamed(context, LoginPage.routeName),
          ),
        ],
      ),
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hitung Umur',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 40),
            MaterialButton(
              onPressed: () =>
                  Navigator.pushNamed(context, HitungUmur.routeName),
              color: Colors.blue,
              child: Text(
                'Go',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 100),
            Text(
              'Bangun Datar',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 40),
            MaterialButton(
              onPressed: () =>
                  Navigator.pushNamed(context, BangunDatar.routeName),
              color: Colors.blue,
              child: Text(
                'Go',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

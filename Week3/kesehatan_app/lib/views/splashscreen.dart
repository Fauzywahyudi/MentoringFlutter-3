import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kesehatan_app/views/login.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, LoginPage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              _buildBg(),
              _buildLogo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            child: ClipRRect(
              child: Image.asset('assets/images/icon.png'),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Text(
              'Kesehatan App',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBg() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: [
          Container(
            height: size.height * 0.65,
            color: Colors.orange[200],
            child: Container(
              height: size.height * 0.65,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(200, 150),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue[300],
            height: size.height * 0.35,
            child: Container(
              height: size.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(200, 150),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

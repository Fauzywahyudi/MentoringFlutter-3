import 'package:flutter/material.dart';
import 'package:go_healthy/src/res/assets.dart';

class LogoApp extends StatelessWidget {
  final double size;

  const LogoApp({this.size});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'icon',
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              appLogo,
            ),
          ),
        ),
      ),
    );
  }
}

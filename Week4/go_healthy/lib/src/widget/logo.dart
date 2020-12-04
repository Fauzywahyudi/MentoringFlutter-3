import 'package:flutter/material.dart';
import 'package:go_healthy/src/res/assets.dart';
import 'package:go_healthy/src/theme/decoration.dart';

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
        ),
        child: Container(
          decoration: circleContainer.copyWith(
              image: DecorationImage(
            image: AssetImage(appLogo),
          )),
        ),
      ),
    );
  }
}

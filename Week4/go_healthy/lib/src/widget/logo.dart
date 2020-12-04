import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogoFinance extends StatelessWidget {
  final double size;

  const LogoFinance({this.size});

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
        child: Icon(
          FontAwesomeIcons.moneyBillWave,
          size: size - 36,
          color: Colors.green,
        ),
      ),
    );
  }
}

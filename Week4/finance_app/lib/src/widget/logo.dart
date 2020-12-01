import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogoFinance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'icon',
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          FontAwesomeIcons.moneyBillWave,
          size: 64,
          color: Colors.green,
        ),
      ),
    );
  }
}

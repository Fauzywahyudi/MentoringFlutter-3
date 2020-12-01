import 'package:flutter/material.dart';

class TextFinance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Finance App",
      style: TextStyle(
          color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

class TextPage extends StatelessWidget {
  final title;

  const TextPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}

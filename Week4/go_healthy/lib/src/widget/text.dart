import 'package:go_healthy/src/theme/decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class TextFinanceGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Finance App",
      style: TextStyle(
          color: Colors.green, fontSize: 24.0, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

class TextAppSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Go Healthy",
      style: TextStyle(
          color: Colors.red, fontSize: 30.0, fontWeight: FontWeight.bold),
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

class NoData extends StatelessWidget {
  final String msg;

  const NoData({@required this.msg});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            child: SvgPicture.asset('assets/images/empty.svg'),
          ),
          Text(
            msg,
            style: textLabel.copyWith(fontSize: 25),
          ),
        ],
      ),
    );
  }
}

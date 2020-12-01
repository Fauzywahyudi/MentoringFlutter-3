import 'package:finance_app/src/config/router.gr.dart';
import 'package:finance_app/src/res/assets.dart';
import 'package:finance_app/src/widget/logo.dart';
import 'package:finance_app/src/widget/text.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String backImg = finance3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(backImg), fit: BoxFit.cover)),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.all(48.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10.0)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 1.0,
                  sigmaY: 1.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new LogoFinance(),
                    const SizedBox(height: 10.0),
                    new TextFinanceGreen(),
                    const SizedBox(height: 20.0),
                    new Text(
                        "Nutritionally balanced, easy to cook recipes. Quality fresh local ingredients.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 30.0),
                    new SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 0,
                        highlightElevation: 0,
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () =>
                            Router.navigator.pushNamed(Router.registerPage),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Text.rich(TextSpan(children: [
                      TextSpan(text: "Already have account? "),
                      WidgetSpan(
                          child: InkWell(
                        onTap: () =>
                            Router.navigator.pushNamed(Router.formLogin),
                        child: Text("Log in",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ))
                    ])),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

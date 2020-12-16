import 'package:go_healthy/src/config/router.gr.dart';
import 'package:go_healthy/src/res/assets.dart';
import 'package:go_healthy/src/widget/logo.dart';
import 'package:go_healthy/src/widget/text.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String backImg = bg1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(backImg), fit: BoxFit.cover),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.all(48.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 48.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 1.0,
                    sigmaY: 1.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new LogoApp(size: 100),
                      const SizedBox(height: 10.0),
                      new TextAppRed(),
                      const SizedBox(height: 20.0),
                      new Text(
                        "Waktu dan kesehatan adalah dua aset berharga yang tidak dikenali dan hargai sampai keduanya hilang.\n(Denis Waitley)",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 30.0),
                      new SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 0,
                          highlightElevation: 0,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Create Account",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () =>
                              Router.navigator.pushNamed(Router.registerPage),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Already have account? "),
                          WidgetSpan(
                            child: InkWell(
                              onTap: () =>
                                  Router.navigator.pushNamed(Router.formLogin),
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

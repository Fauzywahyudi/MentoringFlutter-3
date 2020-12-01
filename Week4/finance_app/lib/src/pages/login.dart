import 'package:finance_app/src/config/router.gr.dart';
import 'package:finance_app/src/res/assets.dart';
import 'package:finance_app/src/theme/decoration.dart';
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
                    Hero(
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
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Finance App",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                        "Nutritionally balanced, easy to cook recipes. Quality fresh local ingredients.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 30.0),
                    SizedBox(
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
                            Router.navigator.pushNamed(Router.loginForm),
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

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(finance1),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 50.0),
                    Hero(
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
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Finance App",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50.0),
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30.0),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: inputBorder,
                        border: inputBorder,
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: inputBorder,
                        border: inputBorder,
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    RaisedButton(
                      elevation: 0,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () => Router.navigator.pushNamedAndRemoveUntil(
                          Router.homePage, (route) => false),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                    ),
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.green,
                ),
                onPressed: () => Navigator.pop(context),
                mini: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}

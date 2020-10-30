import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_week2/views/login.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.powerOff),
            tooltip: 'Logout',
            onPressed: () =>
                Navigator.pushReplacementNamed(context, LoginPage.routeName),
          ),
        ],
      ),
      body: Container(),
    );
  }
}

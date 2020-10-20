import 'package:flutter/material.dart';
import 'package:task1_register_profil/views/profil_page.dart';
import 'package:task1_register_profil/views/register_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        color: Colors.purple.withOpacity(0.8),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 2,
              color: Colors.purple,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      'Task 1',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => onClickMenu(RegisterPage()),
                    child: Text('Register'),
                  ),
                  SizedBox(height: 50),
                  RaisedButton(
                    onPressed: () => onClickMenu(ProfilPage()),
                    child: Text('Profile'),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              height: size.height / 2,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      'Task 2',
                      style: TextStyle(fontSize: 40, color: Colors.purple),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.purple,
                    onPressed: () => onClickMenu(RegisterPage()),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 50),
                  RaisedButton(
                    color: Colors.purple,
                    onPressed: () => onClickMenu(ProfilPage()),
                    child: Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onClickMenu(Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}

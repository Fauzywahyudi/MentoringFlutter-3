import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _tecUsername = TextEditingController();
  var _tecPassword = TextEditingController();

  var _focUsername = FocusNode();
  var _focPassword = FocusNode();

  InputDecoration _inputDecor(String label) {
    return InputDecoration(
      hintText: label,
      border: InputBorder.none,
    );
  }

  BoxDecoration _boxDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              _buildBg(),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBg() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: [
          Container(
            height: size.height * 0.65,
            color: Colors.orange[200],
            child: Container(
              height: size.height * 0.65,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(200, 150),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue[300],
            height: size.height * 0.35,
            child: Container(
              height: size.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(200, 150),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: [
          Container(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kesehatan App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Text(
            'Login System',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: _boxDecor,
            child: TextField(
              controller: _tecUsername,
              focusNode: _focUsername,
              decoration: _inputDecor('Username'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: _boxDecor,
            child: TextField(
              controller: _tecPassword,
              focusNode: _focPassword,
              obscureText: true,
              decoration: _inputDecor('Password'),
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                color: Colors.blue,
                onPressed: () {},
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                color: Colors.blue,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

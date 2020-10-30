import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_week2/views/home.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _tecUsername = TextEditingController();
  TextEditingController _tecPassword = TextEditingController();
  FocusNode _focUsername = FocusNode();
  FocusNode _focPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 500,
              color: Colors.blue,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: size.height * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Text(
                            'Login Account',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: _tecUsername,
                            focusNode: _focUsername,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (v) {
                              FocusScope.of(context).requestFocus(_focPassword);
                            },
                            decoration: InputDecoration(
                              labelText: 'Username',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _tecPassword,
                            focusNode: _focPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  onPressed: onClickLogin,
                                  color: Colors.blue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'LOG IN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Center(child: Text('OR')),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.facebookF,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.googlePlusG,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onClickLogin() {
    String username = _tecUsername.text;
    String password = _tecPassword.text;
    bool validUsername = validasi(username);
    bool validPassword = validasi(password);
    if (!validUsername) {
      showToast('Username tidak boleh kosong');
    } else if (!validPassword) {
      showToast('Password tidak boleh kosong');
    } else {
      if (username == 'admin' && password == 'admin') {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        showToast('Username atau Password salah');
      }
    }
  }

  bool validasi(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
    );
  }
}

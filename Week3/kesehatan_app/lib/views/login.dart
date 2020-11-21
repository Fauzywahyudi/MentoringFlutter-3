import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kesehatan_app/api/web_service.dart';
import 'package:kesehatan_app/models/user.dart';
import 'package:kesehatan_app/models/validasi.dart';
import 'package:kesehatan_app/providers/shared_referenced.dart';
import 'package:kesehatan_app/utils/toast.dart';
import 'package:kesehatan_app/views/home.dart';
import 'package:kesehatan_app/views/register.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _tecUsername = TextEditingController();
  var _tecPassword = TextEditingController();

  var _focUsername = FocusNode();
  var _focPassword = FocusNode();

  final _keyForm = GlobalKey<FormState>();

  MyToast _toast = MyToast();
  DataShared _dataShared = DataShared();

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
        child: Stack(
          children: [
            buildBg(),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Widget buildBg() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: SingleChildScrollView(
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
      ),
    );
  }

  Widget _buildForm() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Form(
        key: _keyForm,
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
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: _boxDecor,
              child: TextField(
                controller: _tecUsername,
                focusNode: _focUsername,
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_focPassword);
                },
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
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  _focPassword.unfocus();
                },
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () => _onLogin(),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () async {
                    final username =
                        await Navigator.pushNamed(context, Register.routeName);
                    if (username == null) _tecUsername.text = '';
                    _tecUsername.text = username;
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onLogin() async {
    MyToast toast = MyToast();
    final form = _keyForm.currentState;
    Valid valUsername = _validUsername();
    Valid valPassword = _validPassword();
    if (form.validate() && valUsername.status && valPassword.status) {
      form.save();
      _login();
    } else {
      if (!valUsername.status) {
        toast.showErrorToast(valUsername.msg);
      } else if (!valPassword.status) {
        toast.showErrorToast(valPassword.msg);
      }
    }
  }

  Valid _validUsername() {
    String value = _tecUsername.text;
    if (value.isEmpty) return Valid(false, 'Username wajib diisi');
    return Valid(true, null);
  }

  Valid _validPassword() {
    String value = _tecPassword.text;
    if (value.isEmpty) return Valid(false, 'Password wajib diisi');
    return Valid(true, null);
  }

  Future<void> _login() async {
    final result = await http.post(WebService.login, body: {
      "username": _tecUsername.text,
      "password": _tecPassword.text,
    });
    if (result.statusCode == 200) {
      final response = jsonDecode(result.body);
      int value = response['value'];
      String msg = response['message'];
      if (value == 1) {
        _toast.showSuccessToast(msg);
        final data = response['data'];
        User user = User(
          idUser: int.parse(data['id_user']),
          username: data['username'],
          namaLengkap: data['nama_lengkap'],
          jk: data['jk'],
          alamat: data['alamat'],
          createAt: data['create_at'],
        );
        _dataShared.saveDataPrefUser(value, user);
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        _toast.showErrorToast(msg);
      }
    }
  }
}

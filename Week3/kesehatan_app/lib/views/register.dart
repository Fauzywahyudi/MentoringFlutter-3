import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kesehatan_app/api/web_service.dart';
import 'package:http/http.dart' as http;
import 'package:kesehatan_app/models/validasi.dart';
import 'package:kesehatan_app/utils/toast.dart';

class Register extends StatefulWidget {
  static const routeName = '/register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _tecUsername = TextEditingController();
  var _tecPassword = TextEditingController();
  var _tecNama = TextEditingController();

  var _focUsername = FocusNode();
  var _focPassword = FocusNode();
  var _focNama = FocusNode();

  final _keyForm = GlobalKey<FormState>();

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
      child: Form(
        key: _keyForm,
        child: Column(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'Kesehatan App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        onPressed: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back),
                        mini: true,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Registrasi',
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
              child: TextFormField(
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
              child: TextFormField(
                controller: _tecPassword,
                focusNode: _focPassword,
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_focNama);
                },
                obscureText: true,
                decoration: _inputDecor('Password'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: _boxDecor,
              child: TextFormField(
                controller: _tecNama,
                focusNode: _focNama,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  _focNama.unfocus();
                },
                decoration: _inputDecor('Nama Lengkap'),
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
                      'Daftar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () => _onRegister(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onRegister() async {
    MyToast toast = MyToast();
    final form = _keyForm.currentState;
    Valid valUsername = _validUsername();
    Valid valPassword = _validPassword();
    Valid valNama = _validNama();
    if (form.validate() &&
        valUsername.status &&
        valPassword.status &&
        valNama.status) {
      form.save();
      _register();
    } else {
      if (!valUsername.status) {
        toast.showErrorToast(valUsername.msg);
      } else if (!valPassword.status) {
        toast.showErrorToast(valPassword.msg);
      } else if (!valNama.status) {
        toast.showErrorToast(valNama.msg);
      }
    }
  }

  Valid _validUsername() {
    String value = _tecUsername.text;
    if (value.isEmpty)
      return Valid(false, 'Username wajib diisi');
    else if (value.length < 6)
      return Valid(false, 'Username minimal 6 karakter');
    else if (value.length > 15)
      return Valid(false, 'Username maksimal 15 karakter');
    return Valid(true, null);
  }

  Valid _validPassword() {
    String value = _tecPassword.text;
    if (value.isEmpty)
      return Valid(false, 'Password wajib diisi');
    else if (value.length < 8)
      return Valid(false, 'Password minimal 8 karakter');
    else if (value == _tecUsername.text)
      return Valid(false, 'Bedakan Password dan Username');
    return Valid(true, null);
  }

  Valid _validNama() {
    String value = _tecNama.text;
    if (value.isEmpty) return Valid(false, 'Nama wajib diisi');
    return Valid(true, null);
  }

  Future<void> _register() async {
    MyToast toast = MyToast();
    final result = await http.post(WebService.register, body: {
      "username": _tecUsername.text,
      "password": _tecPassword.text,
      "nama": _tecNama.text,
    });
    if (result.statusCode == 200) {
      final response = jsonDecode(result.body);
      int value = response['value'];
      String msg = response['message'];
      if (value == 1) {
        toast.showSuccessToast(msg);
        Navigator.pop(context, _tecUsername.text);
      } else {
        toast.showErrorToast(msg);
      }
    }
  }
}

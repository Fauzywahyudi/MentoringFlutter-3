import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              _textField(
                'Name',
                TipeTextField.text,
              ),
              _textField(
                'Username',
                TipeTextField.text,
              ),
              _textField(
                'Email',
                TipeTextField.email,
              ),
              _textField(
                'Enter Password',
                TipeTextField.password,
              ),
              _textField(
                'Confirm Password',
                TipeTextField.password,
              ),
              SizedBox(height: 10),
              Text('Available to be a:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: false, onChanged: null),
                  Text('Mentor'),
                  Checkbox(value: false, onChanged: null),
                  Text('Mentee'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 20),
                  Checkbox(value: false, onChanged: null),
                  Expanded(
                    child: Text(
                      'I faffirm that i have and accept to be bound by the AnitaB.org Code of Conduct, Terms and Privacy Policy. Further, I Consent to use my information for the stated purpose',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {},
                child: Text('Sign Up'),
                color: Colors.lightBlue,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(String label, TipeTextField tipeText) {
    bool isPassword = tipeText == TipeTextField.password ? true : false;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        keyboardType: _setTipe(tipeText),
        obscureText: isPassword ? true : false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: label,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(Icons.visibility_off),
                  onPressed: () {},
                )
              : null,
        ),
      ),
    );
  }

  TextInputType _setTipe(TipeTextField tipe) {
    switch (tipe) {
      case TipeTextField.text:
        return TextInputType.text;
        break;
      case TipeTextField.email:
        return TextInputType.emailAddress;
        break;
      case TipeTextField.password:
        return TextInputType.text;
        break;
      case TipeTextField.number:
        return TextInputType.number;
        break;
      default:
        return TextInputType.text;
        break;
    }
  }
}

enum TipeTextField {
  text,
  password,
  email,
  number,
}

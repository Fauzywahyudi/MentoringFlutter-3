import 'package:go_healthy/src/config/router.gr.dart';
import 'package:go_healthy/src/model/user.dart';
import 'package:go_healthy/src/provider/user_provider.dart';
import 'package:go_healthy/src/res/assets.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:go_healthy/src/validation/register_validation.dart';
import 'package:go_healthy/src/widget/button.dart';
import 'package:go_healthy/src/widget/logo.dart';
import 'package:go_healthy/src/widget/text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterValidation {
  final formKey = GlobalKey<FormState>();

  var _tecEmail = TextEditingController();
  var _tecNama = TextEditingController();
  var _tecPassword = TextEditingController();

  var _focEmail = FocusNode();
  var _focNama = FocusNode();
  var _focPassword = FocusNode();

  String _email;
  String _name;
  String _password;
  bool _obscurePass = true;
  bool _isLoading = false;
  IconData get _iconPass =>
      _obscurePass ? Icons.visibility : Icons.visibility_off;

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
                image: AssetImage(bg2),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20.0),
                      Container(child: Center(child: LogoApp(size: 100))),
                      const SizedBox(height: 10.0),
                      TexApp(),
                      const SizedBox(height: 30.0),
                      TextPage('REGISTER'),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        controller: _tecEmail,
                        focusNode: _focEmail,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: inputDecoration('Email'),
                        validator: validateEmail,
                        onSaved: (value) {
                          _email = value;
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(_focNama);
                        },
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        controller: _tecNama,
                        focusNode: _focNama,
                        textInputAction: TextInputAction.next,
                        decoration: inputDecoration('Nama Lengkap'),
                        validator: validateName,
                        onSaved: (value) {
                          _name = value;
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(_focPassword);
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _tecPassword,
                        focusNode: _focPassword,
                        obscureText: _obscurePass,
                        decoration: inputDecoration('Password').copyWith(
                            suffixIcon: IconButton(
                                icon: Icon(_iconPass), onPressed: setObscure)),
                        validator: validatePassword,
                        onSaved: (value) {
                          _password = value;
                        },
                        onEditingComplete: () {
                          _focPassword.unfocus();
                        },
                      ),
                      const SizedBox(height: 30.0),
                      _isLoading
                          ? MyButtonLoading()
                          : MyButton(
                              text: 'REGISTER',
                              onPressed: onRegister,
                            ),
                      const SizedBox(height: 40.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BackIconButton(onPressed: onBack),
        ],
      ),
    );
  }

  void onRegister() async {
    setLoading();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      UserProvider provider = UserProvider();
      final response = await provider.onRegister(
          User(email: _email, namaLengkap: _name, password: _password));
      if (response) {
        Navigator.pop(context);
        Router.navigator.pushNamed(Router.formLogin);
      }
    }
    setLoading();
  }

  void onBack() async {
    Navigator.pop(context);
  }

  void setLoading() => setState(() => _isLoading = !_isLoading);
  void setObscure() => setState(() => _obscurePass = !_obscurePass);
}

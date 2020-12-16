import 'package:go_healthy/src/config/router.gr.dart';
import 'package:go_healthy/src/model/user.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:go_healthy/src/provider/user_provider.dart';
import 'package:go_healthy/src/res/assets.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:go_healthy/src/validation/register_validation.dart';
import 'package:go_healthy/src/widget/button.dart';
import 'package:go_healthy/src/widget/logo.dart';
import 'package:go_healthy/src/widget/text.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> with RegisterValidation {
  final formKey = GlobalKey<FormState>();

  final dataShared = DataShared();

  var _tecEmail = TextEditingController();
  var _tecPassword = TextEditingController();

  var _focEmail = FocusNode();
  var _focPassword = FocusNode();
  User user = User();

  String _email;
  String _password;
  bool _obscurePass = true;
  bool _isLoading = false;
  IconData get _iconPass =>
      _obscurePass ? Icons.visibility : Icons.visibility_off;

  @override
  void initState() {
    user = getInfoAdmin();
    super.initState();
  }

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
                      const SizedBox(height: 50.0),
                      Container(
                        child: Center(
                          child: new LogoApp(size: 100),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      new TexApp(),
                      const SizedBox(height: 50.0),
                      new TextPage('LOGIN'),
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
                              icon: Icon(_iconPass), onPressed: setObscure),
                        ),
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
                              text: 'LOGIN',
                              onPressed: onLogin,
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

  void onLogin() async {
    setLoading();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      UserProvider provider = UserProvider();
      if (_email == user.email && _password == user.password) {
        await dataShared.setUserPref(user);
        Router.navigator
            .pushNamedAndRemoveUntil(Router.homeAdmin, (route) => false);
      } else {
        final response = await provider.onLogin(
          User(email: _email, password: _password),
        );
        if (response != null) {
          Router.navigator
              .pushNamedAndRemoveUntil(Router.homePage, (route) => false);
        }
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

import 'package:flutter/material.dart';
import 'package:go_healthy/src/theme/decoration.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18.0,
        ),
      ),
      onPressed: onPressed,
      textColor: Colors.white,
      padding: const EdgeInsets.all(16.0),
    );
  }
}

class MyButtonLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class BackIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BackIconButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 0,
      child: SafeArea(
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 45,
            width: 45,
            decoration: circleContainer.copyWith(color: Colors.white),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

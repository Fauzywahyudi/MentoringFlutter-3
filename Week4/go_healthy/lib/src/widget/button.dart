import 'package:flutter/material.dart';

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
      top: 10,
      left: 10,
      child: SafeArea(
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.red,
          ),
          onPressed: onPressed,
          mini: true,
        ),
      ),
    );
  }
}

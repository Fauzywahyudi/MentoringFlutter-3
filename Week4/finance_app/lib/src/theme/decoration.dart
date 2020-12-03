import 'package:flutter/material.dart';

InputBorder inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: BorderSide(color: Colors.white),
);

InputDecoration inputDecoration(String hint) => InputDecoration(
      filled: true,
      fillColor: Colors.white,
      enabledBorder: inputBorder,
      border: inputBorder,
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
        fontSize: 16.0,
      ),
      errorStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.red),
    );

BoxDecoration circleIcon =
    BoxDecoration(shape: BoxShape.circle, color: Colors.green);

TextStyle textMenu = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
TextStyle textTitle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
TextStyle textValue =
    TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold);

TextStyle textWhite = TextStyle(color: Colors.white);
TextStyle textPrimary = TextStyle(color: Colors.green);
TextStyle textDanger = TextStyle(color: Colors.red);
TextStyle textLabel = TextStyle(color: Colors.grey);

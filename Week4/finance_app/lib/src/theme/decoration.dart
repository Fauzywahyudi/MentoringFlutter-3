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

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void awesomeSuccess(BuildContext context, String msg, VoidCallback onOke) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    animType: AnimType.BOTTOMSLIDE,
    title: 'Success',
    desc: msg,
    btnCancelOnPress: () {},
    btnOkOnPress: onOke,
  )..show();
}

void awesomeLogout(
    BuildContext context, String title, String msg, VoidCallback onOke) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    animType: AnimType.BOTTOMSLIDE,
    title: title,
    desc: msg,
    btnOkOnPress: onOke,
    btnCancelOnPress: () {},
  )..show();
}

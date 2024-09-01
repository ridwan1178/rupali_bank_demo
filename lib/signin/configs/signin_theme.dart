import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/main.dart';

class SigninTheme {
  static  TextButtonThemeData textButtonThemeData = TextButtonThemeData(
      style: ButtonStyle(
          padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
          fixedSize: WidgetStatePropertyAll<Size>(Size(ppc.cw(50), ppc.ch(20)))));
}

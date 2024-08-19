import 'package:flutter/material.dart';

class SigninTheme {
  static const TextButtonThemeData textButtonThemeData = TextButtonThemeData(
      style: ButtonStyle(
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
          fixedSize: WidgetStatePropertyAll<Size>(Size(50, 20))));
}

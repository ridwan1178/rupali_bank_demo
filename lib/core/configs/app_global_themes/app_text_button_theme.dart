import 'package:flutter/material.dart';

class AppTextButtonTheme {
  TextButtonThemeData textButton = const TextButtonThemeData(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28)))),
            padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 30)),
            elevation: WidgetStatePropertyAll<double>(10),
            fixedSize: WidgetStatePropertyAll<Size>(Size(115,30))));
}

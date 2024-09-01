import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/main.dart';

class AppTextButtonTheme {
  TextButtonThemeData textButton = TextButtonThemeData(
      style: ButtonStyle(
          shape: const WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(28)))),
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: ppc.cw(30))),
          elevation: WidgetStatePropertyAll<double>(ppc.cw(10)),
          fixedSize:
              WidgetStatePropertyAll<Size>(Size(ppc.cw(115), ppc.ch(30)))));
}

import 'package:flutter/material.dart';

class OnboardingTheme {
  static final onboardingTheme = ThemeData(
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll<Size>(Size(80, 60)))));

  static const elevatedButtonTheme = ElevatedButtonThemeData(
      style:
          ButtonStyle(fixedSize: WidgetStatePropertyAll<Size>(Size(80, 60))));
}

import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/core/configs/app_global_themes/app_navbar_theme.dart';
import 'package:rupali_bank_demo/core/configs/app_global_themes/app_text_button_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    bottomNavigationBarTheme: AppNavbarTheme().botnavbarTheme,
    textButtonTheme: AppTextButtonTheme().textButton,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
  );
}

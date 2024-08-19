import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';

class AppElevatedButtonTheme {
  ElevatedButtonThemeData elevatedButtonTheme =const  ElevatedButtonThemeData(
style: ButtonStyle(
  backgroundColor: WidgetStatePropertyAll<Color>(AppColors.primary),
  foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
  shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),
  ))
  
)
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';

class AppNavbarTheme {
  BottomNavigationBarThemeData botnavbarTheme = const BottomNavigationBarThemeData(
    backgroundColor: AppColors.background,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: Colors.blueGrey,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)

  );
}

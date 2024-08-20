import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';

class AppNavbarTheme {
  BottomNavigationBarThemeData botnavbarTheme = const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: AppColors.primary),
    unselectedIconTheme: IconThemeData(color: Colors.blueGrey),
    backgroundColor: AppColors.background,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: Colors.blueGrey,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 10)

  );
}

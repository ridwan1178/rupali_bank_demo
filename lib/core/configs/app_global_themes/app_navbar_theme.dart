import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/main.dart';

class AppNavbarTheme {
  BottomNavigationBarThemeData botnavbarTheme = BottomNavigationBarThemeData(
    selectedIconTheme: const IconThemeData(color: AppColors.primary),
    unselectedIconTheme: const IconThemeData(color: AppColors.unSelected),
    backgroundColor: AppColors.background,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.unSelected,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: ppc.cf(10)),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: ppc.cf(10))

  );
}

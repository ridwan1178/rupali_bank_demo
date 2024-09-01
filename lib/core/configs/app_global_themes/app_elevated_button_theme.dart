import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/core/configs/app_router_config.dart';
import 'package:rupali_bank_demo/main.dart';

class AppElevatedButtonTheme {



  ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll<Color>(AppColors.primary),
          foregroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(ppc.cw(10))),
          ))));
}

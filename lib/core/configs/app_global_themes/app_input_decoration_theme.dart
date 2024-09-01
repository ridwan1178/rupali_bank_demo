import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/main.dart';

class AppInputDecorationTheme {
  InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      //hintText: hintText,

      filled: true,
      fillColor: Colors.transparent,
      contentPadding: EdgeInsets.all(ppc.cw(20)),
      hintStyle: const TextStyle(
        color: AppColors.unSelected,
      ),
      //labelText: hintText,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ppc.cw(5)),
          borderSide: BorderSide(
            color: AppColors.inputBoxBorder,
            width: ppc.cw(1),
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ppc.cw(5)),
          borderSide: BorderSide(
            color: AppColors.inputBoxBorder,
            width: ppc.cw(1),
          )));
}

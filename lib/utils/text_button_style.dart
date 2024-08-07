import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';

class TextButtonStyle {
  ButtonStyle textButtonStyle =
      ButtonStyle(backgroundColor: 
      WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.pressed)|| states.contains(WidgetState.selected)) {
        return Colors.green;
      } else {
        return AppColors.background;
      }
    },
    
  )
  ,);
}

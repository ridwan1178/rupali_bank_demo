import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';

class StatusIcon extends StatelessWidget {
  final double height;
  final double width;
  final Color containerColor;
  final Color borderColor;
  final Icon icon;

   const StatusIcon({
    super.key,
    required this.borderColor,
    required this.containerColor,
    required this.icon,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      //constraints: BoxConstraints(maxHeight: 20, maxWidth: 20),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: containerColor,
          border: Border.all(color: borderColor)),
      child: AppIcons.tickMark,
    );
  }
}

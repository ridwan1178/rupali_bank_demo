import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/utils/status_icon.dart';

class TopLeft extends StatelessWidget {
  final Icon icon;
  const TopLeft({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StatusIcon(
          height: 30,
          width: 30,
          icon: icon,
          containerColor: Colors.green,
          borderColor: Colors.white),
    );
  }
}
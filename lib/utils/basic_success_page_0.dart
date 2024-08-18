import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class BasicSuccessPage0 extends StatelessWidget {
  final Widget pageText;
  Widget? pageButton;
  BasicSuccessPage0({super.key, required this.pageText, this.pageButton});

  static const namedRoute = "successpage";
  static const path = "/$namedRoute";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: BasicAppbar(hideBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(AppImages.success0),
            pageText,
            pageButton??SizedBox.shrink(),
          ],
        ),
      ),
    ));
  }
}

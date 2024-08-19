import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:go_router/go_router.dart';

class BasicSuccessPage0 extends StatelessWidget {
  // final Widget pageText;
  // Widget? pageButton;
  const BasicSuccessPage0({super.key});

  static const namedRoute = "successpage";
  static const path = "/$namedRoute";

  @override
  Widget build(BuildContext context) {
    Widget extra = GoRouterState.of(context).extra! as Widget;
    return extra;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class TransfersPage extends StatelessWidget {
  const TransfersPage({super.key});
  static const namedRoute = "transferspage";
  static const path = "/transfersspage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBackButton: false),
      body: Center(child: AppIcons.transferActive,));
  }
}
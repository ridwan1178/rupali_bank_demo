import 'package:flutter/cupertino.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';

class TransfersPage extends StatelessWidget {
  const TransfersPage({super.key});
  static const namedRoute = "transferspage";
  static const path = "/transfersspage";

  @override
  Widget build(BuildContext context) {
    return Center(child: AppIcons.transferActive,);
  }
}
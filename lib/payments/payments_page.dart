import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:rupali_bank_demo/utils/basic_bottom_navbar.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  static const namedRoute = "paymentspage";
  static const path = "/paymentspage";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(hideBackButton: false,),
      bottomNavigationBar: BasicBottomNavbar(),
      body: const Center(
        child: AppIcons.payment,
      ),
    );
  }
}

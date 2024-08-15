import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';


class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  static const namedRoute = "paymentspage";
  static const path = "/paymentspage";

  @override
  Widget build(BuildContext context) {
    return   Center(
        child: AppIcons.paymentActive,
      
    );
  }
}

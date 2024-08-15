import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/payments/payments_page.dart';


class PaymentRoutes {
  static final GoRoute paymentPage = GoRoute(
      name: PaymentsPage.namedRoute,
      path: PaymentsPage.path,
      builder: (BuildContext context, GoRouterState state) {
        return const PaymentsPage();
      },
    );
}

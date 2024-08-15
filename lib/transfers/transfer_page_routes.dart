import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:rupali_bank_demo/transfers/transfers_page.dart';

class TransferRoutes {
  static final GoRoute transfersPage = GoRoute(
    name: TransfersPage.namedRoute,
    path: TransfersPage.path,
    builder: (BuildContext context, GoRouterState state) {
      return const TransfersPage();
    },
  );
}

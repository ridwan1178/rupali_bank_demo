import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/home_page/presentation/account_details_page.dart';
import 'package:provider/provider.dart';
import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';

class HomePageRoutes {
  static final GoRoute accountDetails = GoRoute(
    name: AccountDetailsPage.namedRoute,
    path: AccountDetailsPage.path,
    builder: (BuildContext context, GoRouterState state) {
      return 
      const AccountDetailsPage();
      ChangeNotifierProvider(
        create: (context) => HomepageAccountStatementProvider(),
        child: const AccountDetailsPage(),
      );
    },
  );
}

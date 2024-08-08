import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/homepage/presentation/homepage.dart';
import 'package:provider/provider.dart';
import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';

class HomepageRoutes {
  static final GoRoute homepage = GoRoute(
    name: Homepage.namedRoute,
    path: Homepage.path,
    builder: (BuildContext context, GoRouterState state) {
      return ChangeNotifierProvider(
        create: (context) => HomepageAccountStatementProvider(),
        child: const Homepage(),
      );
    },
  );
}

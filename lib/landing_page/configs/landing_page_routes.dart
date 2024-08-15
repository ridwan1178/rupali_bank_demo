import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/home_page/configs/home_page_routes.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';

class LandingPageRoutes {
  static final GoRoute landingPage = GoRoute(
      name: LandingPage.namedRoute,
      path: LandingPage.path,
      //parentNavigatorKey: AppRouterConfig().shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (context) => HomepageAccountStatementProvider(),
          child: const LandingPage(),
        );
      },
      routes: [HomePageRoutes.accountDetails]);


}

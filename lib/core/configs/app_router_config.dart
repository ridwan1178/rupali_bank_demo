import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/cards_page/cards_routes.dart';
import 'package:rupali_bank_demo/landing_page/configs/landing_page_routes.dart';

import 'package:rupali_bank_demo/onboarding/configs/onboarding_routes.dart';
import 'package:rupali_bank_demo/payments/payment_page_routes.dart';
import 'package:rupali_bank_demo/services_page/services_page_routes.dart';

import 'package:rupali_bank_demo/signin/configs/signin_routes.dart';
import 'package:rupali_bank_demo/splash/presentation/splash_page.dart';
import 'package:rupali_bank_demo/transfers/configs/transfer_page_routes.dart';
import 'package:rupali_bank_demo/utils/basic_success_page_0.dart';

class AppRouterConfig {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter? _router;

  static GoRouter get router {
    _router ??= _createRouter();
    return _router!;
  }

  static GoRouter _createRouter() {
    return GoRouter(initialLocation: SplashPage.path, routes: <RouteBase>[
      GoRoute(
        name: SplashPage.namedRoute,
        path: SplashPage.path,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      successPage0,
      OnboardingRoutes.onboardingPage,
      SigninRoutes.signinPage,
      LandingPageRoutes.landingPage,
      PaymentRoutes.paymentPage,
      TransferRoutes.transfersPage,
      TransferRoutes.beneficiaryManagement,
      CardsRoutes.cardsPage,
      ServicesRoutes.servicesPage,
    ]);
  }

  static GoRoute successPage0 = GoRoute(
    name: BasicSuccessPage0.namedRoute,
    path: BasicSuccessPage0.path,
    builder: (context, state) {
      return BasicSuccessPage0();
    },
  );
}

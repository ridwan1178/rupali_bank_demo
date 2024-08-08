import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/homepage/homepage_routes.dart';

import 'package:rupali_bank_demo/onboarding/onboarding_routes.dart';

import 'package:rupali_bank_demo/signin/signin_routes.dart';
import 'package:rupali_bank_demo/splash/splash_page.dart';

class AppRouterConfig {

static GoRouter? _router;

  static GoRouter get router {
    _router ??= _createRouter();
    return _router!;
  }

  static GoRouter _createRouter() {
    return GoRouter(
    
       initialLocation: SplashPage.path,
      routes: <RouteBase>[
        GoRoute(
          name: SplashPage.namedRoute,
          path: SplashPage.path,
          builder: (BuildContext context, GoRouterState state) {
            return const SplashPage();
          },
        ),
        OnboardingRoutes.onboardingPage,
        SigninRoutes.signinPage,
        HomepageRoutes.homepage,
      ]);
  }
}

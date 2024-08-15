import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/onboarding/presentation/onboarding.dart';


class OnboardingRoutes {
  static final GoRoute onboardingPage = GoRoute(
      name: Onboarding.namedRoute,
      path: Onboarding.path,
      builder: (BuildContext context, GoRouterState state) {
        return const Onboarding();
      },
    );
}

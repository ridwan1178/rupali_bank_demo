import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/onboarding/presentation/onboarding.dart';
import 'package:rupali_bank_demo/onboarding/presentation/signin_or_singnup.dart';


class OnboardingRoutes {
  static final GoRoute onboardingPage = GoRoute(
      name: Onboarding.namedRoute,
      path: Onboarding.path,
      builder: (BuildContext context, GoRouterState state) {
        return const Onboarding();
      },
    );


      static final GoRoute signinOrSignupPage = GoRoute(
      name: SigninOrSingnup.namedRoute,
      path: SigninOrSingnup.path,
      builder: (BuildContext context, GoRouterState state) {
        return  SigninOrSingnup();
      },
    );
}

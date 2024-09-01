import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/signup/presentation/signup_page.dart';


class SignupRoutes {
  static final GoRoute signupPage = GoRoute(
      name: SignupPage.namedRoute,
      path: SignupPage.path,
      builder: (BuildContext context, GoRouterState state) {
        return SignupPage();
      },
    );
}

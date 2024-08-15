import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/signin/presentation/signin_page.dart';

class SigninRoutes {
  static final GoRoute signinPage = GoRoute(
      name: SigninPage.namedRoute,
      path: SigninPage.path,
      builder: (BuildContext context, GoRouterState state) {
        return SigninPage();
      },
    );
}

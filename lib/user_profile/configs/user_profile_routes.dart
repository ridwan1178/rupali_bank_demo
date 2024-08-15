import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/user_profile/presentation/user_profile_page.dart';



class UserProfileRoutes {
  static final GoRoute userProfilePageFromLandingPage = GoRoute(
    name: UserProfilePage.namedRoute,
    path: UserProfilePage.landingPagePath,
    builder: (BuildContext context, GoRouterState state) {
      return const UserProfilePage();
    },
  );
}

import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});
  static const namedRoute = "userprofilepage";
  static const path = "/userprofilepage";
  static const landingPagePath = "${LandingPage.namedRoute}/$namedRoute";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: BasicAppbar(hideBackButton: false),
      body: Center(child: Image.asset("assets/images/user_profile_pic.jpg"),),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class AccountDetailsPage extends StatelessWidget {

  
  const AccountDetailsPage({super.key});

  static const String namedRoute = "accountdetails";
  static const String path = "${LandingPage.namedRoute}/accountdetails";

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(appBar: BasicAppbar(hideBackButton: false),body: Placeholder(),));
  }
}
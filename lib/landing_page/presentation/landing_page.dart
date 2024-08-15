import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/cards_page/cards_page.dart';
import 'package:rupali_bank_demo/home_page/presentation/home_page.dart';

import 'package:rupali_bank_demo/payments/payments_page.dart';
import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';
import 'package:rupali_bank_demo/services_page/services_page.dart';
import 'package:rupali_bank_demo/transfers/transfers_page.dart';

import 'package:provider/provider.dart';
import 'package:rupali_bank_demo/utils/basic_bottom_navbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  static const String path = "/landingpage";
  static const String namedRoute = 'landingpage';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //variables and internal functions

  final PageController homepageController =
      PageController(initialPage: 0, keepPage: true);
  int homepageIndex = 0;

  bool hasCardsUpdated = false;

  @override
  void initState() {
    context.read<HomepageAccountStatementProvider>().selectedDefault();

    super.initState();
  }

  @override
  void dispose() {
    homepageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
            height: 68,
            child: BasicBottomNavbar(
              pageController: homepageController,
            )),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: homepageController,
          children: const [
            Homepage(),
            PaymentsPage(),
            TransfersPage(),
            CardsPage(),
            ServicesPage()
          ],
        ),
      ),
    );
  }
}

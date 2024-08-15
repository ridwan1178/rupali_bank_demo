import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:rupali_bank_demo/home_page/components/account_statement_options.dart';
import 'package:rupali_bank_demo/home_page/components/card/card_body.dart';
import 'package:rupali_bank_demo/home_page/presentation/account_details_page.dart';

import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/user_profile.dart';

import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:provider/provider.dart';

import 'package:rupali_bank_demo/utils/dots_indicator_widget.dart';
import 'package:go_router/go_router.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  static const String path = "/homepage";
  static const String namedRoute = 'homepage';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //variables and internal functions
  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
    keepPage: false,
  );
  // final PageController homepageController = PageController(initialPage: 0, keepPage: true);
  // int homepageIndex = 0;
  int currentIndex = 0;

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  bool hasCardsUpdated = false;

  @override
  void initState() {
    context.read<HomepageAccountStatementProvider>().selectedDefault();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void resetCurrentIndex() {
    currentIndex = 0;
  }

  nextFunction() {
    currentIndex++;

    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    currentIndex--;
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: BasicAppbar(
            hideBackButton: true,
            title: UserProfileButton().user,
            profilePic: UserProfileButton().userProfileButton,
          ),
          body: home(context)),
    );
  }

  Column home(BuildContext context) {
    return Column(
      children: [
        _cards(context, context.watch<HomepageAccountStatementProvider>().cards,
            context.watch<HomepageAccountStatementProvider>().refreshKey),
        _dotsForCards(context,
            context.watch<HomepageAccountStatementProvider>().cards.length),
        const AccountStatementOptions(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const Text("Higlights"),
              const Spacer(),
              TextButton(
                  style: const ButtonStyle(
                      padding:
                          WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
                      fixedSize: WidgetStatePropertyAll<Size>(Size(73, 18))),
                  onPressed: () {
                    context.goNamed(AccountDetailsPage.namedRoute);
                  },
                  child: const Text(
                    "View details",
                    style: TextStyle(fontSize: 13),
                  ))
            ],
          ),
        ),
        Flexible(
            child: context.watch<HomepageAccountStatementProvider>().highlights)
      ],
    );
  }

//cards
  Widget _cards(BuildContext context, List<CardBody> cards, Key refreshKey) {
    return SizedBox(
      key: refreshKey,
      height: 180,
      width: 610,
      child: PageView(
          controller: _pageController,
          onPageChanged: (index) => {
                setState(() {
                  currentIndex = index;
                })
              },
          pageSnapping: false,
          padEnds: false,
          scrollDirection: Axis.horizontal,
          children: cards),
    );
  }

  //dots indicator for cards
  SizedBox _dotsForCards(BuildContext context, int pageCount) {
    if (context.read<HomepageAccountStatementProvider>().updateFlag) {
      _pageController.jumpTo(0);
      currentIndex = 0;
      context.read<HomepageAccountStatementProvider>().clearUpdateFlag();
    }

    try {
      return SizedBox(
        child: DotsIndicatorWidget(
            currentIndex: currentIndex, pageCount: pageCount),
      );
    } catch (e) {
      return const SizedBox();
    }
  }
}

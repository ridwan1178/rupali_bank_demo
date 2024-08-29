import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';

import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/onboarding/presentation/signin_or_singnup.dart';

import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/utils/dots_indicator_widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const namedRoute = "onboarding";
  static const path = "/onboarding";

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  final int pageCount = 3;
  final double pages = 3;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  final PageController _pageController = PageController();
  bool isFirstPage = true;
  bool isLastPage = false;

  static const List<String> content1 = [
    AppImages.onboarding1,
    "Transfer",
    "Transfer your money to anywhere you want. Be it our bank account, other bank account, wallet etc."
  ];
  static const List<String> content2 = [
    AppImages.onboarding2,
    "Payment",
    "Pay anything to anybody you want. We support from top-up to marchant payments."
  ];
  static const List<String> content3 = [
    AppImages.onboarding3,
    "Manage",
    "Manage your accounts including loans, RDs, checque books, cards everything from a signle point!"
  ];

  void next() {
    setState(() {
      if (!isLastPage) {
        currentIndex++;
        isFirstPage = false;
        if (currentIndex == pageCount - 1) {
          isLastPage = true;
        }
      }
    });
  }

  void previous() {
    setState(() {
      if (!isFirstPage) {
        currentIndex--;
        isLastPage = false;
        if (currentIndex == 0) {
          isFirstPage = true;
        }
      }
    });
  }

  void setLastPage() {
    isLastPage = true;
    isFirstPage = false;
    setState(() {
      currentIndex = pageCount - 1;
    });
    _pageController.jumpToPage(currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  nextFunction() {
    next();
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    previous();
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: null,
            leading: isFirstPage
                ? null
                : IconButton(
                    onPressed: () {
                      previousFunction();
                    },
                    icon: AppIcons.backButton)),
        body: Stack(children: [
          IgnorePointer(
            child: PageView(
              controller: _pageController,
              children: [
                _page(content1),
                _page(content2),
                _page(content3),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: ppc.ch(43),
                    left: ppc.cw(18),
                    right: ppc.cw(24),
                    top: ppc.cw(42)),
                child: SizedBox(
                  height: ppc.ch(60),
                  width: ppc.cw(333),
                  child: Row(
                    children: [
                      isLastPage
                          ? const SizedBox.shrink()
                          : ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      const WidgetStatePropertyAll<Color>(
                                          Colors.white),
                                  foregroundColor:
                                      const WidgetStatePropertyAll<Color>(
                                          Colors.black),
                                  elevation:
                                      const WidgetStatePropertyAll<double>(0.0),
                                  fixedSize: WidgetStatePropertyAll<Size>(
                                      Size(ppc.cw(80), ppc.ch(60)))),
                              onPressed: () => {setLastPage()},
                              child: const Text("Skip")),
                      const Expanded(child: SizedBox()),
                      isLastPage
                          ? ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: WidgetStatePropertyAll<Size>(
                                      Size(ppc.cw(80), ppc.ch(60)))),
                              onPressed: () => {
                                    context.pushReplacementNamed(
                                        SigninOrSingnup.namedRoute
                                        // SigninPage.namedRoute
                                        )
                                  },
                              child: AppIcons.onboardingNextButton)
                          : ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: WidgetStatePropertyAll<Size>(
                                      Size(ppc.cw(80), ppc.ch(60)))),
                              onPressed: nextFunction,
                              child: AppIcons.onboardingNextButton),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _page(List<String> content) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: ppc.ch(100), left: ppc.ch(32)),
          child: Image.asset(content[0]),
        ),
        SizedBox(
          height: ppc.ch(58),
        ),
        Text(
          content[1],
          style: TextStyle(
              fontSize: ppc.cf(28),
              fontWeight: FontWeight.w700,
              letterSpacing: -1),
        ),
        SizedBox(
          height: ppc.ch(10),
        ),
        Padding(
          padding: EdgeInsets.only(left: ppc.cw(36), right: ppc.cw(46)),
          child: Text(
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: ppc.cf(16), fontWeight: FontWeight.w400),
              content[2]),
        ),
        Padding(
          padding: EdgeInsets.only(top: ppc.ch(50)),
          child: DotsIndicatorWidget(
              currentIndex: currentIndex, pageCount: pageCount),
        )
      ],
    );
  }
}

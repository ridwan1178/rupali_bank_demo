import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';
import 'package:rupali_bank_demo/signin/presentation/signin_page.dart';
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
                _page1(),
                _page2(),
                _page3(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 43,
                  horizontal: 18,
                ),
                child: SizedBox(
                  height: 60,
                  width: 333,
                  child: Row(
                    children: [
                      isLastPage
                          ? const SizedBox()
                          : ElevatedButton(
                            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                            foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                            elevation: WidgetStatePropertyAll<double>(0.0),
                            fixedSize: WidgetStatePropertyAll<Size>(Size(80, 60))
                            ),
                              onPressed: () => {setLastPage()},
                              child: const Text("Skip")),
                      const Expanded(child: SizedBox()),
                      isLastPage
                          ? 
                           
                             ElevatedButton(
                              
                              style:const  ButtonStyle(fixedSize: WidgetStatePropertyAll<Size>(Size(80, 60))),
                                onPressed: () => {
                                      context
                                          .pushReplacementNamed(SigninPage.namedRoute)
                                    },
                                child: AppIcons.onboardingNextButton)
                          
                          : ElevatedButton(
                            style:const  ButtonStyle(fixedSize: WidgetStatePropertyAll<Size>(Size(80, 60))),
                              onPressed: nextFunction, child: AppIcons.onboardingNextButton),
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

  Widget _page1() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 123,
      ),
      child: Column(
        children: [
          Image.asset(AppImages.onboarding1),
          const SizedBox(
            height: 58,
          ),
          const Text("Transfer"),
          const SizedBox(
            height: 10,
          ),
          const Text(
              "Transfer your money to anywhere you want. Be it our bank account, other bank account, wallet etc."),
          DotsIndicatorWidget(currentIndex: currentIndex, pageCount: pageCount)
        ],
      ),
    );
  }

  Widget _page2() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 123,
      ),
      child: Column(
        children: [
          Image.asset(AppImages.onboarding2),
          const SizedBox(
            height: 58,
          ),
          const Text("Payment"),
          const SizedBox(
            height: 10,
          ),
          const Text(
              "Pay anything to anybody you want. We support from top-up to marchant payments."),
          DotsIndicatorWidget(currentIndex: currentIndex, pageCount: pageCount),
        ],
      ),
    );
  }

  Widget _page3() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 123,
      ),
      child: Column(
        children: [
          Image.asset(AppImages.onboarding3),
          const SizedBox(
            height: 58,
          ),
          const Text("Manage"),
          const SizedBox(
            height: 10,
          ),
          const Text(
              "Manage your accounts including loans, RDs, checque books, cards everything from a signle point!"),
          DotsIndicatorWidget(currentIndex: currentIndex, pageCount: pageCount),
        ],
      ),
    );
  }
}

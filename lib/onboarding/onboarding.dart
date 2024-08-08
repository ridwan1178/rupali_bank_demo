import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';
import 'package:rupali_bank_demo/signin/signin_page.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
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
                    icon: const Icon(Icons.arrow_back))),
        body: Stack(children: [
          PageView(
            controller: _pageController,
            children: [
              _page1(),
              _page2(),
              _page3(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 43,
                horizontal: 18,
              ),
              child: Row(
                children: [
                  isLastPage
                      ? const SizedBox()
                      : ElevatedButton(
                          onPressed: previousFunction,
                          child: const Text("Skip")),
                  const Expanded(child: SizedBox()),
                  //const Spacer(),

                  isLastPage
                      ? ElevatedButton(
                          onPressed: () => {
                            context.pushReplacementNamed(SigninPage.namedRoute)
                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             SigninPage()),
                                //     (route) => false)
                              },
                          child: const Text("sign in"))
                      : ElevatedButton(
                          onPressed: nextFunction, child: const Text("next")),
                ],
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
          // DotsIndicatorWidget(currentIndex: currentIndex, pageCount: pageCount),
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

// class DotsIndicatorWidget extends StatelessWidget {
//   const DotsIndicatorWidget(
//       {super.key, required this.currentIndex, required this.pageCount});

//   final int currentIndex;
//   final int pageCount;

//   @override
//   Widget build(BuildContext context) {
//     return DotsIndicator(
//       dotsCount: pageCount,
//       position: currentIndex,
//       decorator: DotsDecorator(
//         size: const Size.square(9.0),
//         activeSize: const Size(18.0, 9.0),
//         activeShape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//       ),
//     );
//   }
// }

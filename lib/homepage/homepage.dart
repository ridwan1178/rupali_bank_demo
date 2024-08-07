import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/homepage/account_statement_scroller.dart';
import 'package:rupali_bank_demo/homepage/card/card_body.dart';
import 'package:rupali_bank_demo/homepage/cards.dart';
import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:provider/provider.dart';
import 'package:rupali_bank_demo/utils/dots_indicator_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

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
  int currentIndex = 0;
  Key _refreshKey = UniqueKey();
  // final int pageCount = 4;
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
    //List<TextButton> options = AccountStatementScroller(context).addOptions();

    return SafeArea(
      child: Scaffold(
        appBar: const BasicAppbar(hideBackButton: true),
        body: Column(
          //key: context.read<HomepageAccountStatementProvider>().refreshKey,
          children: [
            // _cardsRebuilder(),
            _cards(
                context,
                context.read<HomepageAccountStatementProvider>().cards,
                context.read<HomepageAccountStatementProvider>().refreshKey),

            _dotsRebuilder(),
            _accountStatementOptions(),
            //WidgetScroller(options: options, showDots: false, value: value),
            const Row(
              children: [Placeholder()],
            )
          ],
        ),
      ),
    );
  }

//cards
  Widget _cards(BuildContext context, List<CardBody> cards, Key refreshKey) {
    // if (hasCardsUpdated) {
    //   _pageController.jumpToPage(1);
    // }
    return SizedBox(
      key: refreshKey,
      height: 180,
      width: 610,
      child: PageView(
          controller: _pageController,
          onPageChanged: (index) => {
                setState(() {
                  currentIndex = index;
                 // hasCardsUpdated = true;

                  // if (hasCardsUpdated == false) {
                  //   currentIndex = index;
                  // } else if (hasCardsUpdated == true) {
                  //   currentIndex = 0;
                  //   hasCardsUpdated = false;
                  // }
                })
              },
          pageSnapping: false,
          padEnds: false,
          scrollDirection: Axis.horizontal,
          children: cards),
    );
  }

  //cards re builder
  // Widget _cardsRebuilder() {
  //   return Consumer<HomepageAccountStatementProvider>(builder:
  //       (BuildContext context, HomepageAccountStatementProvider obj,
  //           Widget? child) {
  //     List<CardBody> cards = obj.cards;
  //     //dispose();
  //     hasCardsUpdated = true;
  //     return _cards(context, cards);
  //   });
  // }

  //dots indicator for cards
  SizedBox _dotsForCards(BuildContext context, int pageCount) {
    try {
      return SizedBox(
        child: DotsIndicatorWidget(
            currentIndex: currentIndex, pageCount: pageCount),
      );
    } catch (e) {
      return const SizedBox();
    }
  }

//dots indicator widget rebuilder
  Widget _dotsRebuilder() {
    return Consumer<HomepageAccountStatementProvider>(
      builder: (BuildContext context, HomepageAccountStatementProvider obj,
          Widget? child) {
        int pageCount = obj.cards.length;

        return _dotsForCards(context, pageCount);
      },
    );
  }

  //account statement options
  Widget _accountStatementOptions() {
    return SizedBox(
      height: 33,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AccountStatementScroller(context).addOptions(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/homepage/account_statement_options.dart';
import 'package:rupali_bank_demo/homepage/card/card_body.dart';
import 'package:rupali_bank_demo/homepage/highlights/cards_highlights.dart';
import 'package:rupali_bank_demo/homepage/highlights/general_savings_highlights.dart';
import 'package:rupali_bank_demo/homepage/presentation/account_details_page.dart';
import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';
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
        appBar: const BasicAppbar(hideBackButton: true),
        bottomNavigationBar: const BottomAppBar(
          color: Colors.grey,
        ),
        body: Column(
          children: [
            _cards(
                context,
                context.watch<HomepageAccountStatementProvider>().cards,
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
                      onPressed: () {
                        context.goNamed(AccountDetailsPage.namedRoute);
                      },
                      child: const Text("View details"))
                ],
              ),
            ),
           // GeneralSavingsHighlights(),
           Flexible(child: context.watch<HomepageAccountStatementProvider>().highlights)
            //highlights()
            // Expanded(
            //   child: SizedBox(
            //     height: 305,
            //     width: 333,
            //     child:  gridView()),
            // )
          ],
        ),
      ),
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

  Widget highlights() {
    return Expanded(
      child: SizedBox(
        height: 305,
        width: 333,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              flexibleSpace: 
                 const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TabBar(
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.grey,
                     // padding: EdgeInsets.all(4),
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      indicatorSize: null,
                      tabs: [
                        Tab(text: "Year"),
                        Tab(text: "Month"),
                        Tab(text: "Week"),
                      ],
                    )
                  ],
                ),
              
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TabBarView(
                children: [gridView(), gridView(), gridView()],
              ),
            ),
          ),
        ),
      ),
    );
    
  }

  Widget gridView() {
    return GridView.count(
      childAspectRatio: 1.5,//1.81,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        Container(
          height: 45,
          width: 75,
          decoration: BoxDecoration(
            color: const Color.fromARGB(15, 46, 156, 220),
            borderRadius: BorderRadius.circular(10),
          ),
          child:const  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total withdrawal"),
              Text("420k")
            ],
          ),
        ),
        SizedBox(
          height: 45,
          width: 90,
          child: ColoredBox(color: Colors.blueGrey),
        ),
        Container(
          height: 45,
          width: 75,
          color: Colors.blueGrey,
        ),
        Container(
          color: Colors.blueGrey,
        ),
        Container(
          height: 45,
          width: 75,
          color: Colors.blueGrey,
        )
      ],
    );
  }
}

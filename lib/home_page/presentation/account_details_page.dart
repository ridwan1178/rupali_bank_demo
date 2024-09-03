import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/home_page/components/card/card_body.dart';
import 'package:rupali_bank_demo/home_page/presentation/home_page.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:provider/provider.dart';
import 'package:rupali_bank_demo/utils/dots_indicator_widget.dart';
import 'package:go_router/go_router.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  static const String namedRoute = "accountdetails";
  static const String path = "/$namedRoute";

  @override
  State<AccountDetailsPage> createState() => AccountDetailsPageState();
  // AccountDetailsPageState of(BuildContext context) =>
  //   context.findAncestorStateOfType<AccountDetailsPageState>()!;
}

class AccountDetailsPageState extends State<AccountDetailsPage> {
  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
    keepPage: false,
  );

  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void resetCurrentIndex() {
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    var pageTitle = PageTitleWiget("Fund Transfer", true);
    // List<CardBody> cards = GoRouterState.of(context).extra! as List<CardBody>;
    Map<String, dynamic> detailItems =
        GoRouterState.of(context).extra! as Map<String, dynamic>;
    List<CardBody> cards = detailItems["cards"] as List<CardBody>;
    Widget details = detailItems["details"] as Widget;
    // //currentIndex = detailItems["index"];

    return SafeArea(
        child: Scaffold(
      appBar: BasicAppbar(
        hideBackButton: false,
        title: pageTitle.pageTitle(),
        centerTitle: true,
        // route: LandingPage.namedRoute,
        // extra: 0,
      ),
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 0,
            child: Container(
              constraints: BoxConstraints(minHeight: ppc.ch(180)),
              child:  _cards(context, cards)),
            
          ),
           _dotsForCards(context, cards.length),
            
          
          
          Text("Transactions" ,style: TextStyle(fontSize: ppc.cf(18), fontWeight: FontWeight.w700),),
          Flexible(fit: FlexFit.tight, flex: 0, child: 
          details
          )
        ],
      ),
    ));
  }

  Column home(BuildContext context, List<CardBody> cards) {
    return Column(
      children: [
        Flexible(
          fit: FlexFit.loose,
          flex: 2,
          child: SizedBox() ,
        ),
        _dotsForCards(context, cards.length),
        // Padding(
        //   padding: EdgeInsets.only(left: ppc.cw(19), right: ppc.cw(24)),
        // ),
        // Flexible(
        //     fit: FlexFit.tight,
        //     child: context
        //         .watch<HomepageAccountStatementProvider>()
        //         .highlights[currentIndex])
      ],
    );
  }

  //cards
  Widget _cards(BuildContext context, List<CardBody> cards) {
    return SizedBox(
      height: ppc.ch(180),
      width: ppc.cw(610),
      child: Padding(
        padding: EdgeInsets.only(left: ppc.cw(19)),
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) => {
                  setState(() {
                    currentIndex = index;
                    print("## CURRENT INDEX == $currentIndex ##");
                  })
                },
            pageSnapping: false,
            padEnds: false,
            scrollDirection: Axis.horizontal,
            children: cards),
      ),
    );
  }

  //dots indicator for cards
  SizedBox _dotsForCards(BuildContext context, int pageCount) {
    // if (context.read<HomepageAccountStatementProvider>().updateFlag) {
    //   _pageController.jumpTo(0);
    //   currentIndex = 0;
    //   context.read<HomepageAccountStatementProvider>().clearUpdateFlag();
    // }

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

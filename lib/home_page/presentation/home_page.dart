import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';

import 'package:rupali_bank_demo/home_page/components/account_statement_options.dart';
import 'package:rupali_bank_demo/home_page/components/card/card_body.dart';
import 'package:rupali_bank_demo/home_page/presentation/account_details_page.dart';
import 'package:rupali_bank_demo/main.dart';

import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/user_profile_widget.dart';

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
    return Scaffold(
            appBar: BasicAppbar(
              hideBackButton: true,
              title: UserProfileButton(context).user,
              profilePic: UserProfileButton(context).userProfileImage(),
            ),
            body: home(context)
      
    );
  }

  Column home(BuildContext context) {
    return Column(
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: SizedBox(
            height: ppc.ch(180),
            
            child: _cards(context, context.watch<HomepageAccountStatementProvider>().cards,
                context.watch<HomepageAccountStatementProvider>().refreshKey),
          ),
        ),
        _dotsForCards(context,
            context.watch<HomepageAccountStatementProvider>().cards.length),
        const AccountStatementOptions(),
         Padding(
           padding:  EdgeInsets.only(left: ppc.cw(19), right:  ppc.cw(24)),
           child: Row(
              children: [
                 Padding(
                  padding:  EdgeInsets.only(top: ppc.ch(22), bottom: ppc.ch(19),),
                  child: Text("Higlights", style: TextStyle(fontSize: ppc.cf(18), fontWeight: FontWeight.w700, height: ppc.clh(18, 27)),)),
                
                const Spacer(),
                
                   GestureDetector(
                    onTap: () => 
                            context.goNamed(AccountDetailsPage.namedRoute),
                          
                     child: SizedBox(
                          
                            child:  Text(
                                  "View details",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: ppc.cf(12), color: AppColors.primary, fontWeight: FontWeight.w400, height: ppc.clh(12, 18,),),
                                ),
                              
                            ),
                   ),
                   
                  
                
              ],
            ),
         ),
        
        context.watch<HomepageAccountStatementProvider>().highlights
      ],
    );
  }

//cards
  Widget _cards(BuildContext context, List<CardBody> cards, Key refreshKey) {
    return SizedBox(
      key: refreshKey,
      height: ppc.ch(180),
      width: ppc.cw(610),
      child: Padding(
        padding: EdgeInsets.only(left: ppc.cw(19)),
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
      ),
      
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

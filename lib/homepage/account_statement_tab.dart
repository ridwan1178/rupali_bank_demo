import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/homepage/card/card_body.dart';
import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';
import 'package:rupali_bank_demo/utils/dots_indicator_widget.dart';
import 'package:provider/provider.dart';

class WidgetScroller extends StatefulWidget {
   WidgetScroller({super.key, this.options, required this.showDots, required this.value
      // required this.generator,
      });

  final List<TextButton>? options;
  final bool showDots;
  final HomepageAccountStatementProvider value;

  @override
  State<WidgetScroller> createState() => _WidgetScrollerState();
}

class _WidgetScrollerState extends State<WidgetScroller> {
  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
  );
  int currentIndex = 0;
  // final int pageCount = 4;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  void initState() {
    widget.value.selectedSavings();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
    return Flexible(
        child: Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 171, maxWidth: 610),
          child: _pageView(context),
        ),
        _dots(context)
      ],
    ));
  }

  SizedBox _dots(BuildContext context) {
    return SizedBox(
      child: widget.showDots
          ? DotsIndicatorWidget(
              currentIndex: currentIndex,
              pageCount: widget.value.cards.length)
          : null,
    );
  }

  Widget _pageView(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) => {
        setState(() {
          currentIndex = index;
        })
      },
      pageSnapping: false,
      padEnds: false,
      scrollDirection: Axis.horizontal,
      //clipBehavior: Clip.hardEdge,
      children: widget.options ??
          widget.value.cards,
    );
  }
}

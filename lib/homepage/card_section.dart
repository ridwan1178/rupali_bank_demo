import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/homepage/card/card_body.dart';
import 'package:rupali_bank_demo/utils/dots_indicator_widget.dart';


class CardSection extends StatefulWidget {
  const CardSection({
    super.key,
  });

  @override
  State<CardSection> createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {
  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
  );
  int currentIndex = 0;
  final int pageCount = 4;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

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
    return Column(
      children: [
        SizedBox(
          height: 180,
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
            //clipBehavior: Clip.hardEdge,
            children: [CardBody(), CardBody(), CardBody(), CardBody()],
          ),
        ),
        DotsIndicatorWidget(currentIndex: currentIndex, pageCount: pageCount),
      ],
    );
  }
}

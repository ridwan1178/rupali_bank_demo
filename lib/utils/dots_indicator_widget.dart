import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class DotsIndicatorWidget extends StatelessWidget {
   DotsIndicatorWidget(
      {super.key, required this.currentIndex, required this.pageCount});

   int currentIndex;
  final int pageCount;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    //band aid fix
    if (currentIndex > pageCount) {
      currentIndex = 0;
    }

    return DotsIndicator(
      dotsCount: pageCount,
      position: currentIndex,
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}

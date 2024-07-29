import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget(
      {super.key, required this.currentIndex, required this.pageCount});

  final int currentIndex;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
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
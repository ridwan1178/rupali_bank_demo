import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/homepage/card/bottom_left.dart';
import 'package:rupali_bank_demo/homepage/card/bottom_right.dart';
import 'package:rupali_bank_demo/homepage/card/top_left.dart';
import 'package:rupali_bank_demo/homepage/card/top_right.dart';

class CardBody extends StatelessWidget {
  final Color? color;
  const CardBody({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 610,
      child: Card(
        color: color,
        child: Column(
          children: [
            Row(
              children: [
                const TopLeft(icon: AppIcons.tickMark),
                const Spacer(),
                TopRight(
                  context: context,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [BottomLeft(), Spacer(), BottomRight()],
            )
          ],
        ),
      ),
    );
    //DotsIndicatorWidget(currentIndex: currentIndex, pageCount: pageCount)
  }
}

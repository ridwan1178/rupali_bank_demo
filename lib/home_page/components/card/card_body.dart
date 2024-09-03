import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/home_page/components/card/bottom_left.dart';
import 'package:rupali_bank_demo/home_page/components/card/bottom_right.dart';
import 'package:rupali_bank_demo/home_page/components/card/top_left.dart';
import 'package:rupali_bank_demo/home_page/components/card/top_right.dart';
import 'package:rupali_bank_demo/main.dart';

class CardBody extends StatelessWidget {
  final Color? startColor;
  final Color? endColor;
  const CardBody({super.key, this.startColor, this.endColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ppc.ch(180),
      width: ppc.cw(350),
      child: Flexible(
        fit: FlexFit.tight,
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                endColor ?? const Color(0xff2E9DDC),
                startColor ?? const Color(0xff219653)
              ]),
              borderRadius: const BorderRadius.all(Radius.circular(
                      10.0) //                 <--- border radius here
                  ),
            ),
            child: Padding(
              padding: EdgeInsets.only(right: ppc.cw(20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Flexible(
                          fit: FlexFit.tight,
                          child: TopLeft(icon: AppIcons.tickMark)),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: EdgeInsets.only(top: ppc.ch(33)),
                        child: TopRight(
                          context: context,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ppc.cw(47.93)),
                    child: const Row(
                      children: [BottomLeft(), BottomRight()],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    //DotsIndicatorWidget(currentIndex: currentIndex, pageCount: pageCount)
  }
}

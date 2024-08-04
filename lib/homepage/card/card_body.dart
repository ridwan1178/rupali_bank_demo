import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/homepage/card/bottom_left.dart';
import 'package:rupali_bank_demo/homepage/card/bottom_right.dart';
import 'package:rupali_bank_demo/homepage/card/top_left.dart';
import 'package:rupali_bank_demo/homepage/card/top_right.dart';

class CardBody extends StatelessWidget {
  const CardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: AppColors.primary,
          child: Column(
            children: [
              Row(
                children: [
                  TopLeft(icon: AppIcons.tickMark),
                  Spacer(),
                  TopRight(
                    context: context,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  BottomLeft(),
                  Spacer(),
                  BottomRight()
                ],
              )
            ],
          ),
        ),
        //DotsIndicatorWidget(currentIndex: currentIndex, pageCount: pageCount)
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/core/configs/app_router_config.dart';
import 'package:rupali_bank_demo/main.dart';

class SigninOrSingnup extends StatelessWidget {
  SigninOrSingnup({super.key});
  

  static const String namedRoute = "signinorsignup";
  static const String path = "/$namedRoute";

  static const String t1 =
      "Getting your digital banking account set up is quick and easy. We’ll take you through the process step by step.";

  @override
  Widget build(BuildContext context) {
    // AppSizeConfig appSizeConfig = AppSizeConfig(context);
    // PixelToPercentageConverter ppc = PixelToPercentageConverter();

    double radioContainerwidth = ppc.cw(238);
    // ppc.cw(238);
    double radioContainerHeight = ppc.ch(180);
    // ppc.ch(180);

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            headingText(),
            Padding(
              padding: EdgeInsets.only(
                left: ppc.cw(69),
                right: ppc.cw(68),
                top: ppc.ch(24),
              ),
              child: Container(
                color: AppColors.fadedGreenbg,
                width: radioContainerwidth,
                height: radioContainerHeight,
                child: Column(
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Padding headingText() {
    return Padding(
      padding: EdgeInsets.only(
        left: ppc.cw(33),
        right: ppc.cw(32),
        top: ppc.ch(14),
      ),
      child: Text(
        t1,
        style: TextStyle(
          fontSize: ppc.cf(12),
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

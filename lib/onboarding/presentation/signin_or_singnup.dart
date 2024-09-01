import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/core/configs/app_router_config.dart';
import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/signin/presentation/signin_page.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/signup/presentation/signup_page.dart';
import 'package:rupali_bank_demo/utils/status_icon.dart';

class SigninOrSingnup extends StatefulWidget {
  SigninOrSingnup({super.key});

  static const String namedRoute = "signinorsignup";
  static const String path = "/$namedRoute";

  static const String t1 =
      "Getting your digital banking account set up is quick and easy. We’ll take you through the process step by step.";

  @override
  State<SigninOrSingnup> createState() => _SigninOrSingnupState();
}

class _SigninOrSingnupState extends State<SigninOrSingnup> {
  String route = "";

  double radioContainerwidth = ppc.cw(238);

  double radioContainerHeight = ppc.ch(180);

  bool selectedSignin = false;
  bool selectedSignup = false;

  List<String> optionDescription = [
    "Select this option if you already have an account (Savings, Current, Card etc.) with Rupali Bank and want to set up online banking access.",
    "Select this option if you do not have an account with Rupali Bank and would like to open one and set up online banking access."
  ];

  @override
  Widget build(BuildContext context) {
    const String signin = SigninPage.namedRoute;
    const String signup = SignupPage.namedRoute;

    Widget signinRadio = selectedSignin
        ? StatusIcon(
            borderColor: AppColors.primary,
            containerColor: AppColors.primary,
            icon: AppIcons.tickMark,
            height: ppc.ch(28),
            width: ppc.cw(28))
        : AppIcons.onboardingUnselected;
    Widget signupRadio = selectedSignup
        ? StatusIcon(
            borderColor: AppColors.primary,
            containerColor: AppColors.primary,
            icon: AppIcons.tickMark,
            height: ppc.ch(28),
            width: ppc.cw(28))
        : AppIcons.onboardingUnselected;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            headingText(),
            radioContainer(signin, "I already have an account", signinRadio),
            optionDescriptor(optionDescription[0]),
            Padding(
              padding: EdgeInsets.only(top: ppc.ch(19), bottom: ppc.ch(5)),
              child: Text(
                "OR",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: ppc.cf(20)),
              ),
            ),
            radioContainer(signup, "I want to open a new account", signupRadio),
            optionDescriptor(optionDescription[1]),
              SizedBox(height: ppc.ch(23),),
            ElevatedButton(
                style: ButtonStyle(
                    fixedSize:
                        WidgetStatePropertyAll(Size(ppc.cw(96), ppc.ch(60))),
                       ),
                        
                onPressed: () {
                  context.goNamed(route);
                },
                child: Text("Next", style: TextStyle(fontSize: ppc.cf(16), fontWeight: FontWeight.w500),))
          ],
        ),
      ),
    ));
  }

  SizedBox optionDescriptor(String text) {
    return SizedBox(
        height: ppc.ch(54),
        width: ppc.cw(294),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: ppc.cf(12), fontWeight: FontWeight.w400),
        ));
  }

  Padding radioContainer(String value, String text, Widget radio) {
    return Padding(
      padding: EdgeInsets.only(
          left: ppc.cw(69),
          right: ppc.cw(68),
          top: ppc.ch(24),
          bottom: ppc.ch(15)),
      child: GestureDetector(
        onTap: () {
          if (value == SigninPage.namedRoute) {
            setState(() {
              selectedSignin = true;
              selectedSignup = false;
              route = value;
            });
          } else if (value == SignupPage.namedRoute) {
            setState(() {
              selectedSignup = true;
              selectedSignin = false;
              route = value;
            });
          } else {
            throw UnimplementedError();
          }
        },
        child: Container(
          color: AppColors.fadedGreenbg,
          width: radioContainerwidth,
          height: radioContainerHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcons.onboardingSignin,
              containerText(text),
              radio
              // Radio(
              //   value: value,
              //   groupValue: route,
              //   activeColor: AppColors.primary,
              //   fillColor: WidgetStatePropertyAll(AppColors.primary),
              //   onChanged: (value) {
              //     route = value!;
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget containerText(String text) => SizedBox(
      height: ppc.ch(56),
      width: ppc.cw(198),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: ppc.cf(16)),
      ));

  Padding headingText() {
    return Padding(
      padding: EdgeInsets.only(
        left: ppc.cw(33),
        right: ppc.cw(32),
        top: ppc.ch(14),
      ),
      child: Text(
        SigninOrSingnup.t1,
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

import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';
import 'package:rupali_bank_demo/onboarding/onboarding.dart';
//import 'package:rupali_bank_demo/onboarding/onboarding_1.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(AppImages.splash),
    ));
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const Onboarding()));
  }
}

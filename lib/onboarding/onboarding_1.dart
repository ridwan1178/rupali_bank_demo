import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 123,
        ),
        child: Center(
          child: Column(
            
              children:[ 
              _image(),
              const SizedBox(height: 58,)
              
              ],
            ),
        ),
      ),
      
    );
  }

  Widget _image() {
    return Image.asset(AppImages.onboarding1);
  }
}

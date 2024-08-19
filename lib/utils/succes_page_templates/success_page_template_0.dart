import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class SuccessPageTemplate0 extends StatelessWidget {
  final Widget? image;
  final Widget? text;
  final String? namedRoute;
  final dynamic extra;
  final String? buttonName;
  SuccessPageTemplate0(
      {super.key, this.image, this.text, this.namedRoute, this.buttonName, this.extra});

  bool showButton = false;

  // void assertParam(){
  //   if(namedRoute != null && buttonName == null){
  //     assert()
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    if (namedRoute != null) {
      showButton = true;
    }
    return SafeArea(
        child: Scaffold(
          appBar:const  BasicAppbar(hideBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //children: [Image.asset(AppImages.success0), extra],
          children: [
            image ?? const SizedBox.shrink(),
            const SizedBox(
              height: 17,
            ),
            text ?? const SizedBox.shrink(),
            const SizedBox(
              height: 169,
            ),
            showButton
                ? ElevatedButton(
                    onPressed: () => context.goNamed(namedRoute!, extra: extra),
                    child: Text(buttonName!))
                : const SizedBox.shrink(),
          ],
        ),
      ),
    ));
  }
}

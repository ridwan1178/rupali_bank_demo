import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/main.dart';

class PageTitleWiget {
  final String titleText;

  PageTitleWiget(this.titleText);

  bool centerTitle = true;

  Widget pageTitle() {
    return Flexible(
        fit: FlexFit.tight,
        child: Row(
          children: [
            const SizedBox.shrink(),
            
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: ppc.cw(35)),
                child: Text(
                  titleText,
                  style:  TextStyle(fontSize: ppc.cf(18), fontWeight: FontWeight.w600),
                ),
              ),
            ),
           
            IconButton(onPressed: () => {}, icon: AppIcons.toolBar),
          ],
        ));
  }
}

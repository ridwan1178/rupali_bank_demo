import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/main.dart';

class PageTitleWiget {
  final String titleText;
  final bool hideToolbar; 

  PageTitleWiget(this.titleText, this.hideToolbar);

  bool centerTitle = true;

  Widget pageTitle() {
    return Flexible(
        fit: FlexFit.tight,
        child: Row(
          
          children: [
            
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: ppc.cw(35)),
                child: Text(
                  titleText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ppc.cf(18), fontWeight: FontWeight.w600),
                ),
              ),
            ),
            hideToolbar ? const SizedBox.shrink():  IconButton(onPressed: () => {}, icon: AppIcons.toolBar),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';

class PageTitleWiget {
  final String titleText;

  PageTitleWiget(this.titleText);

  bool centerTitle = true;

  Widget pageTitle() {
    return Flexible(
        fit: FlexFit.loose,
        child: Row(
          children: [
            const SizedBox.shrink(),
            const Spacer(),
            Text(
              titleText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            IconButton(onPressed: () => {}, icon: AppIcons.toolBar),
          ],
        ));
  }
}

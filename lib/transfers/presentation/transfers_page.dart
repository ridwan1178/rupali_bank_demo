import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class TransfersPage extends StatelessWidget {
  const TransfersPage({super.key});
  static const namedRoute = "transferspage";
  static const path = "/transfersspage";

  @override
  Widget build(BuildContext context) {
    var pageTitle = PageTitleWiget("Fund Transfer");
    return Scaffold(
        appBar: BasicAppbar(
          hideBackButton: false,
          title: pageTitle.pageTitle(),
          centerTitle: pageTitle.centerTitle,
        ),
        body: Center(
          child: AppIcons.transferActive,
        ));
  }
}

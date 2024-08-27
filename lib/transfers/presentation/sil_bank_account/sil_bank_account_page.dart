import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:rupali_bank_demo/transfers/components/sil_bank_page_options.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class SilBankAccountPage extends StatelessWidget {
  const SilBankAccountPage({super.key});

  static const namedRoute = "silbankaccountpage";
  static const path = "/$namedRoute";

  @override
  Widget build(BuildContext context) {
    var pageTitle = PageTitleWiget("Fund Transfer");
    return SafeArea(child: Scaffold(
      
      appBar: BasicAppbar(hideBackButton: false, title: pageTitle.pageTitle(), centerTitle: pageTitle.centerTitle, route: LandingPage.namedRoute, extra: 2,),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            
            children: [SilBankPageOptions(context).options[0], SilBankPageOptions(context).options[1]],
          ),
        ),
      ),
    ));
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:rupali_bank_demo/transfers/components/beneficiary_management_options.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';


class BeneficiaryManagement extends StatelessWidget {
  const BeneficiaryManagement({super.key});

  static const namedRoute = "beneficiarymanagement";
  static const path = "/$namedRoute";

  @override
  Widget build(BuildContext context) {
    var pageTitle = PageTitleWiget("Beneficiary Management");
    return SafeArea(child: Scaffold(
      
      appBar: BasicAppbar(hideBackButton: false, title: pageTitle.pageTitle(), centerTitle: pageTitle.centerTitle, route: LandingPage.namedRoute, extra: 2,),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            
            children: BeneficiaryManagementOptions(context).getOptions(),
          ),
        ),
      ),
    ));
  }
}
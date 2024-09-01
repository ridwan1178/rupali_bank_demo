import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:rupali_bank_demo/main.dart';
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
    List<Widget> options = BeneficiaryManagementOptions(context).options;
    return SafeArea(
        child: Scaffold(
      appBar: BasicAppbar(
        hideBackButton: false,
        title: pageTitle.pageTitle(),
        centerTitle: pageTitle.centerTitle,
        route: LandingPage.namedRoute,
        extra: 2,
      ),
      body: Padding(
        padding:  EdgeInsets.all(ppc.cw(21)),
        child: SizedBox(
          height: ppc.ch(203),
          width: ppc.cw(333),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              options[0],
              const Expanded(
                  child: SizedBox(
                height: 9,
              )),
              options[1]
            ],
          ),
        ),
      ),
    ));
  }
}

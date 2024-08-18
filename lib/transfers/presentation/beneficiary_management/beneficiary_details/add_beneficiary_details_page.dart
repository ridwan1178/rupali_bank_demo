import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/add_beneficiary_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_management_page.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class AddBeneficiaryDetailsPage extends StatelessWidget {
  const AddBeneficiaryDetailsPage({super.key});
    static const String namedRoute = "addbeneficiarypage";
  static const String path = "${AddBeneficiaryPage.namedRoute}/$namedRoute";

  @override
  Widget build(BuildContext context) {
    var pageTitle = PageTitleWiget("Add Beneficiary");
    return SafeArea(child: Scaffold(
      appBar: BasicAppbar(
        hideBackButton: false,
        title: pageTitle.pageTitle(),
        centerTitle: pageTitle.centerTitle,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    ));
  }
}
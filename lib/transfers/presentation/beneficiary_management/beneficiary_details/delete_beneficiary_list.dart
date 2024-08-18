import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/delete_beneficiary_page.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class DeleteBeneficiaryList extends StatelessWidget {
  const DeleteBeneficiaryList({super.key});

  static const namedRoute = "deletebeneficiarylist";
  static const path = "${DeleteBeneficiaryPage.namedRoute}/$namedRoute";

  @override
  Widget build(BuildContext context) {
        var pageTitle = PageTitleWiget("Delete Beneficiary");
    return SafeArea(child: Scaffold(
      appBar: BasicAppbar(hideBackButton: false, title: pageTitle.pageTitle(), centerTitle: pageTitle.centerTitle,),
      body: Placeholder(),
    ));
  }
}

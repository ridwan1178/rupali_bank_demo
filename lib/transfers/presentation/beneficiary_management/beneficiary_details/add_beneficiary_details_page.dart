import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_global_themes/app_input_decoration_theme.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/add_beneficiary_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_management_page.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:rupali_bank_demo/utils/basic_success_page_0.dart';
import 'package:go_router/go_router.dart';

class AddBeneficiaryDetailsPage extends StatelessWidget {
  AddBeneficiaryDetailsPage({super.key});
  static const String namedRoute = "addbeneficiarypage";
  static const String path = "${AddBeneficiaryPage.namedRoute}/$namedRoute";

  final TextEditingController _accountName = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pageTitle = PageTitleWiget("Add Beneficiary");
    return SafeArea(
        child: Scaffold(
      appBar: BasicAppbar(
        hideBackButton: false,
        title: pageTitle.pageTitle(),
        centerTitle: pageTitle.centerTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 330,
              child: Column(
                children: [
                  Text("Account Number"),
                  _accountNumberField(context),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Account Name"),
                  _accountNameField(context),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BasicSuccessPage0(
                                            pageText: successText(), pageButton: returnButton(context),)),
                                )
                          },
                      child: Text("Submit")),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget successText() {
    return Center(
      child: Column(
        children: [
          Text("Success", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
          Text("Beneficiary has been added successfully. Go back to Transfer and transfer to the beneficiary.")
        ],
      ),
    );
  }

  Widget returnButton(BuildContext context){
    return ElevatedButton(onPressed: (){
      context.goNamed(LandingPage.namedRoute, extra: 2);
    }, child: Text("Return to Transfer"));
  }

  Widget _accountNumberField(context) {
    return TextField(
        controller: _accountNumber,
        decoration: InputDecoration(hintText: "e.g 2498126821640")
            .applyDefaults(AppInputDecorationTheme().inputDecorationTheme));
  }

  Widget _accountNameField(context) {
    return TextField(
        controller: _accountName,
        decoration: InputDecoration(hintText: "e.g Master Skibidi")
            .applyDefaults(AppInputDecorationTheme().inputDecorationTheme));
  }
}

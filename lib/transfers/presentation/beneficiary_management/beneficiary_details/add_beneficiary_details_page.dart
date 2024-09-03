import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_global_themes/app_input_decoration_theme.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:rupali_bank_demo/providers/beneficiary_management_provider.dart';
import 'package:rupali_bank_demo/models/beneficiary_model.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/add_beneficiary_page.dart';
import 'package:provider/provider.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:rupali_bank_demo/utils/basic_success_page_0.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/scheduler.dart';
import 'package:rupali_bank_demo/utils/succes_page_templates/success_page_template_0.dart';

class AddBeneficiaryDetailsPage extends StatelessWidget {
  AddBeneficiaryDetailsPage({super.key});
  static const String namedRoute = "addbeneficiarypage";
  static const String path = "${AddBeneficiaryPage.namedRoute}/$namedRoute";

  final TextEditingController _accountName = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pageTitle = PageTitleWiget("Add Beneficiary", false);
    BeneficiaryModel beneficiary;
    String name;
    String accNum;
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
                  const Text("Account Number"),
                  _accountNumberField(context),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Account Name"),
                  _accountNameField(context),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () => {
                         name = _accountName.text.toString(),
                         accNum= _accountNumber.text.toString(),
                         print("Name: $name \n account Num:$accNum"),
                        beneficiary = BeneficiaryModel(name: name, accNumber: accNum),
                        context.read<BeneficiaryManagementProvider>().addBeneficiaryWithNotify(beneficiary),
                        for(var ben in context.read<BeneficiaryManagementProvider>().beneficiaries){
                          print("${ben.name}\n${ben.accNumber}")
                        },
                        //success page route
                            context.goNamed(BasicSuccessPage0.namedRoute,
                                extra: SuccessPageTemplate0(image: Image.asset(AppImages.success0),
                                namedRoute: LandingPage.namedRoute, extra: 2, buttonName: "Return to Transfer Page", text: successText(),))

                          },
                      child: const Text("Submit")),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget successText() {
    return const Center(
      child: Column(
        children: [
          
           Text(
            "Success",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
           SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:  Text(
                "Beneficiary has been added successfully. Go back to Transfer and transfer to the beneficiary.", ),
          ),
          
        ],
      ),
    );
  }

  Widget returnButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            context.goNamed(LandingPage.namedRoute, extra: 2);
          });
        },
        child: Text("Return to Transfer"));
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

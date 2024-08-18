import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_details/add_beneficiary_details_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_management_page.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:go_router/go_router.dart';

class AddBeneficiaryPage extends StatelessWidget {
  const AddBeneficiaryPage({super.key});
  static const String namedRoute = "addbeneficiary";
  static const String path = "${BeneficiaryManagement.namedRoute}/$namedRoute";

  static const IconData silBanking = Icons.account_balance;
    static const IconData otherBanks = Icons.assured_workload;
      static const IconData mfsTransfer = Icons.account_balance_wallet;

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
      body: Center(
        child: Column(
          children: [
           const  Align(
              alignment: Alignment.topLeft,
               child: Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text("Select Transfer Type",),
               )),
            options(silBanking, AddBeneficiaryDetailsPage.namedRoute, context),
            options(otherBanks, AddBeneficiaryDetailsPage.namedRoute, context),
            options(mfsTransfer, AddBeneficiaryDetailsPage.namedRoute, context),
          ],
        ),
      ),
    ));
  }

  Widget options(IconData icon, String namedRoute, BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.pushNamed(namedRoute);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 97,
            width: 333,
            decoration: BoxDecoration(
              color: const Color.fromARGB(15, 46, 156, 220),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: AppColors.primary,
                ),
                const Text(
                  "Sil Bank Account",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/main.dart';
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
    var pageTitle = PageTitleWiget("Add Beneficiary", false);
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
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 23, top: 21),
                  child: Text(
                    "Select Transfer Type",
                    style: TextStyle(
                      fontSize: ppc.cf(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
            options(AppIcons.ftSilBank, AddBeneficiaryDetailsPage.namedRoute,
                context, "SIL Banking"),
            options(AppIcons.ftOtherBanks, AddBeneficiaryDetailsPage.namedRoute,
                context, "Other Banks"),
            options(AppIcons.ftMfsTransfer,
                AddBeneficiaryDetailsPage.namedRoute, context, "MFS Transfer"),
          ],
        ),
      ),
    ));
  }

  Widget options(
      Widget icon, String namedRoute, BuildContext context, String text) {
    return GestureDetector(
        onTap: () {
          context.pushNamed(namedRoute);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 9),
          child: Container(
            height: ppc.ch(97),
            width: ppc.cw(333),
            decoration: BoxDecoration(
              color: AppColors.fadedGreenbg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: ppc.cf(14), fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

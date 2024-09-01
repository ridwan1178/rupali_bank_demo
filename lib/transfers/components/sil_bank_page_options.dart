import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/main.dart';

import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/delete_beneficiary_page.dart';

class SilBankPageOptions {
  SilBankPageOptions(this.context);
  final BuildContext context;

  late List<Widget> _options;

  List<Widget> get options => _getOptions();

  List<Widget> _getOptions() {
    double height = ppc.ch(160);
    double width = ppc.cw(333);
    Widget betweenOwnAccounts = GestureDetector(
      onTap: () {
        // pushNamed(AddBeneficiaryPage.namedRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.fadedGreenbg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcons.transferActive,
               Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Between own Accounts",
                  style: TextStyle(fontSize: ppc.cf(14), fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );

    Widget otherSilAccounts = GestureDetector(
      onTap: () {
        pushNamed(DeleteBeneficiaryPage.namedRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.fadedPurplebg,
            // Color.fromARGB(255, 225, 206, 243),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcons.ftSilBankToOtherSilAccount,
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "To Other SIL Accounts",
                  style: TextStyle(fontSize: ppc.cf(14), fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );

    return _options = [betweenOwnAccounts, otherSilAccounts];
  }

  void pushNamed(String namedRoute) {
    context.pushNamed(namedRoute);
  }
}

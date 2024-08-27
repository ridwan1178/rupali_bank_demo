import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';

import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/delete_beneficiary_page.dart';

class SilBankPageOptions {
  SilBankPageOptions(this.context);
  final BuildContext context;

  late List<Widget> _options;

  List<Widget> get options => _getOptions();

  List<Widget> _getOptions() {
    double height = 160;
    double width = 333;
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
            color: const Color.fromARGB(15, 46, 156, 220),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcons.transferActive,
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Between own Accounts",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
            color: const Color.fromARGB(13, 155, 81, 224),
            // Color.fromARGB(255, 225, 206, 243),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcons.ftSilBankToOtherSilAccount,
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "To Other SIL Accounts",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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

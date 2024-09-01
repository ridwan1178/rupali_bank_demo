import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_management_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/sil_bank_account/sil_bank_account_page.dart';

class FundTransferOptions {
  FundTransferOptions(this.context);
  final BuildContext context;

  late List<Widget> options;

  List<Widget> getOptions() {
    Widget silBankAccount = GestureDetector(
      onTap: () => context.pushNamed(SilBankAccountPage.namedRoute),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(15, 46, 156, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.ftSilBank,
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Sil Bank Account",
                style: TextStyle(
                    fontSize: ppc.cf(14), fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );

    Widget otherBankAccount = GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(15, 46, 156, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.ftOtherBanks,
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Other Bank Account",
                style: TextStyle(
                    fontSize: ppc.cf(14), fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );

    Widget mfsTransfer = GestureDetector(
      onTap: () => {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(15, 46, 156, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.ftMfsTransfer,
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "MFS Transfer",
                style: TextStyle(
                    fontSize: ppc.cf(14), fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );

    Widget transferHistory = GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(15, 46, 156, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.ftTransferHistory,
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Transfer History",
                style: TextStyle(
                    fontSize: ppc.cf(14), fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );

    Widget favTransfers = GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(15, 46, 156, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.ftFavourite,
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Favourite Transfers",
                style: TextStyle(
                    fontSize: ppc.cf(14), fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );

    Widget benficiaryManagement = GestureDetector(
      onTap: () {
        pushNamed(BeneficiaryManagement.namedRoute);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(15, 46, 156, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.ftBeneficiaryManagement,
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Beneficiary Mgt",
                style: TextStyle(
                    fontSize: ppc.cf(14), fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );

    return options = [
      silBankAccount,
      otherBankAccount,
      mfsTransfer,
      transferHistory,
      favTransfers,
      benficiaryManagement
    ];
  }

  void pushNamed(String namedRoute) {
    context.pushNamed(namedRoute);
  }
}

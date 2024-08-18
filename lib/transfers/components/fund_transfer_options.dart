import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_management_page.dart';

class FundTransferOptions {
  FundTransferOptions(this.context);
  final BuildContext context;

  late List<Widget> options;

  List<Widget> getOptions() {
    Widget silBankAccount = Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(15, 46, 156, 220),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_balance,
              color: AppColors.primary,
            ),
          ),
          const Text(
            "Sil Bank Account",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );

    Widget otherBankAccount = Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(15, 46, 156, 220),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.assured_workload,
              color: AppColors.primary,
            ),
          ),
          const Text(
            "Other Bank Account",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );

    Widget mfsTransfer = GestureDetector(
      onTap: ()=>{},
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(15, 46, 156, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
                Icons.account_balance_wallet,
                color: AppColors.primary,
              ),
            
            const Text(
              "MFS Transfer",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );

    Widget transferHistory = Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(15, 46, 156, 220),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.update,
              color: AppColors.primary,
            ),
          ),
          const Text(
            "Transfer History",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );

    Widget favTransfers = Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(15, 46, 156, 220),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: AppColors.primary,
            ),
          ),
          const Text(
            "Favourite Transfers",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
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
        child:const  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
                Icons.groups,
                color: AppColors.primary,
              ),
            
            const Text(
              "Beneficiary Management",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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

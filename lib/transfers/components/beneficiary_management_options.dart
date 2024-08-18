import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/add_beneficiary_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/delete_beneficiary_page.dart';

class BeneficiaryManagementOptions {
  BeneficiaryManagementOptions(this.context);
  final BuildContext context;

  late List<Widget> options;

  List<Widget> getOptions() {
    Widget addBeneficiary = GestureDetector(
      onTap: () {
        pushNamed(AddBeneficiaryPage.namedRoute);
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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_add,
                color: AppColors.primary,
              ),
              const Text(
                "Add beneficiary",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );

    Widget deletebeneficiary = GestureDetector(
      onTap: () {
        pushNamed(DeleteBeneficiaryPage.namedRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 97,
          width: 333,
          decoration: BoxDecoration(
            color: Colors.red[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person_remove,
                color: Colors.red,
              ),
              const Text(
                "Delete beneficiary",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );

    return options = [addBeneficiary, deletebeneficiary];
  }

  void pushNamed(String namedRoute) {
    context.pushNamed(namedRoute);
  }
}

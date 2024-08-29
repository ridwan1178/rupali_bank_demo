import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/add_beneficiary_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/delete_beneficiary_page.dart';

class BeneficiaryManagementOptions {
  BeneficiaryManagementOptions(this.context);
  final BuildContext context;

  late List<Widget> _options;

  List<Widget> get options => _getOptions();

  List<Widget> _getOptions() {
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
            color: AppColors.fadedGreenbg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcons.ftAddBeneficiary,
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Add beneficiary",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
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
            color: AppColors.fadedRedbg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcons.ftDeleteBeneficiary,
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Delete beneficiary",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );

    return _options = [addBeneficiary, deletebeneficiary];
  }

  void pushNamed(String namedRoute) {
    context.pushNamed(namedRoute);
  }
}

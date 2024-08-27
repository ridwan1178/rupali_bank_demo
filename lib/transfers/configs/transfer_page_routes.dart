import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rupali_bank_demo/providers/beneficiary_management_provider.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/add_beneficiary_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_details/add_beneficiary_details_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_details/delete_beneficiary_list.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_management_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/delete_beneficiary_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/sil_bank_account/sil_bank_account_page.dart';

import 'package:rupali_bank_demo/transfers/presentation/transfers_page.dart';

class TransferRoutes {
  static final GoRoute transfersPage = GoRoute(
    name: TransfersPage.namedRoute,
    path: TransfersPage.path,
    builder: (BuildContext context, GoRouterState state) {
      return const TransfersPage();
    },
  );

  static final silBankAccountPage = GoRoute(
    path: SilBankAccountPage.path,
    name: SilBankAccountPage.namedRoute,
    builder: (context, state) {
      return SilBankAccountPage();
    },
  );

  static final beneficiaryManagement = GoRoute(
      path: BeneficiaryManagement.path,
      name: BeneficiaryManagement.namedRoute,
      builder: (context, state) {
        return ChangeNotifierProvider(
            create: (context) => BeneficiaryManagementProvider(),
            child: BeneficiaryManagement());
      },
      routes: [_addBeneficiaryPage, _deleteBeneficiaryPage]);

  static final GoRoute _addBeneficiaryPage = GoRoute(
      name: AddBeneficiaryPage.namedRoute,
      path: AddBeneficiaryPage.path,
      builder: (BuildContext context, GoRouterState state) {
        return const AddBeneficiaryPage();
      },
      routes: [_addBeneficiaryDetailsPage]);

  static final GoRoute _addBeneficiaryDetailsPage = GoRoute(
    name: AddBeneficiaryDetailsPage.namedRoute,
    path: AddBeneficiaryDetailsPage.path,
    builder: (context, state) {
      return ChangeNotifierProvider(
          create: (context) => BeneficiaryManagementProvider(),
          child: AddBeneficiaryDetailsPage());
    },
  );

  static final GoRoute _deleteBeneficiaryPage = GoRoute(
      name: DeleteBeneficiaryPage.namedRoute,
      path: DeleteBeneficiaryPage.path,
      builder: (BuildContext context, GoRouterState state) {
        return const DeleteBeneficiaryPage();
      },
      routes: [_deleteBeneficiaryList]);

  static final GoRoute _deleteBeneficiaryList = GoRoute(
    name: DeleteBeneficiaryList.namedRoute,
    path: DeleteBeneficiaryList.path,
    builder: (context, state) {
      return DeleteBeneficiaryList();
    },
  );
}

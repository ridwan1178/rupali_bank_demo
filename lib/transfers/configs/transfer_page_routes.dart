import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/add_beneficiary_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_details/add_beneficiary_details_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_details/delete_beneficiary_list.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/beneficiary_management_page.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/delete_beneficiary_page.dart';

import 'package:rupali_bank_demo/transfers/presentation/transfers_page.dart';

class TransferRoutes {
  static final GoRoute transfersPage = GoRoute(
    name: TransfersPage.namedRoute,
    path: TransfersPage.path,
    builder: (BuildContext context, GoRouterState state) {
      return const TransfersPage();
    },
  );

  static final beneficiaryManagement = GoRoute(
    path: BeneficiaryManagement.path,
    name: BeneficiaryManagement.namedRoute,
    builder: (context, state) {
      return BeneficiaryManagement();
    },
    routes: [
      addBeneficiaryPage,
      deleteBeneficiaryPage
    ]
  );

    static final GoRoute addBeneficiaryPage = GoRoute(
    name: AddBeneficiaryPage.namedRoute,
    path: AddBeneficiaryPage.path,
    builder: (BuildContext context, GoRouterState state) {
      return const AddBeneficiaryPage();
    },
    routes: [addBeneficiaryDetailsPage]
  );

      static final GoRoute addBeneficiaryDetailsPage = GoRoute(
    name: AddBeneficiaryDetailsPage.namedRoute,
    path: AddBeneficiaryDetailsPage.path,
    builder: (BuildContext context, GoRouterState state) {
      return const AddBeneficiaryDetailsPage();
    },
  );

    static final GoRoute deleteBeneficiaryPage = GoRoute(
    name: DeleteBeneficiaryPage.namedRoute,
    path: DeleteBeneficiaryPage.path,
    builder: (BuildContext context, GoRouterState state) {
      return const DeleteBeneficiaryPage();
    },
    routes: [deleteBeneficiaryList]
  );

      static final GoRoute deleteBeneficiaryList = GoRoute(
    name: DeleteBeneficiaryList.namedRoute,
    path: DeleteBeneficiaryList.path,
    builder: (BuildContext context, GoRouterState state) {
      return const DeleteBeneficiaryList();
    },
  );
}

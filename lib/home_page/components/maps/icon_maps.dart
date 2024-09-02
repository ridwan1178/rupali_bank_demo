import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_constants.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';

class IconMaps {
  static Map<String, Widget> gsIconMap = {
    AppConstants.tDeposit: AppIcons.hpTotalDep,
    AppConstants.tWithdraw: AppIcons.hpTotalWithdraw,
    AppConstants.tPay: AppIcons.hpTotalPay,
    AppConstants.tTrans: AppIcons.hpTotalTrans,
  };

  static Map<String, Widget> lnIconMap = {
    AppConstants.emiAmnt: AppIcons.hpEmiAmnt,
    AppConstants.nextEmi: AppIcons.hpNextEmi,
    AppConstants.pendingEmi: AppIcons.hpPendingEmi,
    AppConstants.expDate: AppIcons.hpExpDate,
    AppConstants.intRate: AppIcons.hpIntrate,
    AppConstants.status: AppIcons.hpStatus,
  };

  static Map<String, Widget> dpsIconMap = {
    AppConstants.instAmnt: AppIcons.hpInstAmnt,
    AppConstants.nextInst: AppIcons.hpNextInst,
    AppConstants.matAmnt: AppIcons.hpMatAmnt,
    AppConstants.matDate: AppIcons.hpMatDate,
    AppConstants.tInst: AppIcons.hpTotalInst,
    AppConstants.instPending: AppIcons.hpInstPending
  };

  static Map<String, Widget> fdIconMap = {
    AppConstants.pAmnt: AppIcons.hpPrincipalAmnt,
    AppConstants.tenor: AppIcons.hpTenor,
    AppConstants.maturedIn: AppIcons.hpMaturedIn,
    AppConstants.matDate: AppIcons.hpMatDate,
    AppConstants.opDate: AppIcons.hpOpeningDate,
    AppConstants.intRate: AppIcons.hpIntrate,
  };
}

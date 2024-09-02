import 'package:rupali_bank_demo/core/configs/app_constants.dart';

class GeneralSavingsModel {
  final String totalDeposit, totalWIthdraw, totalPay, totalTransfer;

  GeneralSavingsModel(
      this.totalDeposit, this.totalWIthdraw, this.totalPay, this.totalTransfer);

  Map<String, String> get data => {
        AppConstants.tDeposit: totalDeposit,
        AppConstants.tWithdraw: totalWIthdraw,
        AppConstants.tPay: totalPay,
        AppConstants.tTrans: totalTransfer,
      };
}

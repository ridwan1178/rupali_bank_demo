import 'package:rupali_bank_demo/core/configs/app_constants.dart';

class TitleMaps {
  static Map<String, String> gsMap = {
    AppConstants.tDeposit: "Total Deposit",
    AppConstants.tWithdraw: "Total Withdrawal",
    AppConstants.tPay: "Total Payment",
    AppConstants.tTrans: "Total Transfer"
  };

  static Map<String, String> lnMap = {
    AppConstants.emiAmnt: "EMI Amount",
    AppConstants.nextEmi: "Next EMI on",
    AppConstants.pendingEmi: "EMI Pending",
    AppConstants.expDate: "Expiry Date",
    AppConstants.intRate: "Interest Rate",
    AppConstants.status: "Status"
  };

  static Map<String, String> dpsMap = {
    AppConstants.instAmnt: "Installment Amount",
    AppConstants.nextInst: "Next Installment on",
    AppConstants.matAmnt: "Maturity Amount",
    AppConstants.matDate: "Maturity Date",
    AppConstants.tInst: "Total Installment",
    AppConstants.instPending: "Installment Pending"
  };
}

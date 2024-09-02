import 'package:rupali_bank_demo/core/configs/app_constants.dart';

class LoanModel {
  final String emiAmnt, nextEmi, pendingEmi, expDate, intRate, status;

  LoanModel(this.emiAmnt, this.nextEmi, this.pendingEmi, this.expDate,
      this.intRate, this.status);

  Map<String, String> get data => {
        AppConstants.emiAmnt: emiAmnt,
        AppConstants.nextEmi: nextEmi,
        AppConstants.pendingEmi: pendingEmi,
        AppConstants.expDate: expDate,
        AppConstants.intRate: intRate,
        AppConstants.status: status,
      };
}

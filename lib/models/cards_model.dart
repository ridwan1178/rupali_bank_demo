import 'package:rupali_bank_demo/core/configs/app_constants.dart';

class CardsModel {
  final String minPayDue, payDueBy, currLim, availableBalance;

  CardsModel(
      this.minPayDue, this.payDueBy, this.currLim, this.availableBalance);

  Map<String, String> get data => {
        AppConstants.minPayDue: minPayDue,
        AppConstants.payDueBy: payDueBy,
        AppConstants.currLim: currLim,
        AppConstants.availableBalance: availableBalance
      };
}

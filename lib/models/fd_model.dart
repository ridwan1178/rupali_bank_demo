import 'package:rupali_bank_demo/core/configs/app_constants.dart';

class FdModel {
  final String pAmnt, matDate, tenor, maturedIn, intRate, openingDate;

  FdModel(
    this.pAmnt,
    this.openingDate,
    this.tenor,
    this.maturedIn,
    this.intRate,
    this.matDate,
  );

  Map<String, String> get data => {
        AppConstants.pAmnt: pAmnt,
        AppConstants.tenor: tenor,
        AppConstants.maturedIn: maturedIn,
        AppConstants.matDate: matDate,
        AppConstants.opDate: openingDate,
        AppConstants.intRate: intRate,
      };
}

import 'package:rupali_bank_demo/core/configs/app_constants.dart';

class DpsModel{
    final String instAmnt, nextInst, instPending, matDate, matAmnt, totalInst;

  DpsModel(this.instAmnt, this.nextInst, this.instPending, this.matDate, this.matAmnt, this.totalInst);

  Map<String, String> get data => {
        AppConstants.instAmnt: instAmnt,
        AppConstants.nextInst: nextInst,
        AppConstants.instPending: instPending,
        AppConstants.matDate: matDate,
        AppConstants.matAmnt: matAmnt,
        AppConstants.tInst: totalInst,
      };
}
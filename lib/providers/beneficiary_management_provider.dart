import 'package:flutter/cupertino.dart';
import 'package:rupali_bank_demo/transfers/models/beneficiary_model.dart';

class BeneficiaryManagementProvider extends ChangeNotifier {
 
 static  List<BeneficiaryModel> _beneficiaries = [];

  BeneficiaryModel p1 = BeneficiaryModel(name: "p1", accNumber: "1111111");
  BeneficiaryModel p2 = BeneficiaryModel(name: "p2", accNumber: "2222222");
  BeneficiaryModel p3 = BeneficiaryModel(name: "p3", accNumber: "33333333");

  List<BeneficiaryModel> get beneficiaries {
    return _beneficiaries;
  }

  void setDefaultBenefeciaries() {
    _beneficiaries.add(p1);
    _beneficiaries.add(p2);
    _beneficiaries.add(p3);
  }

  void addBeneficiaryWithNotify(BeneficiaryModel beneficiary) {
    _beneficiaries.add(beneficiary);
    notifyListeners();
  }

  void addBeneficiary(BeneficiaryModel beneficiary) {
    _beneficiaries.add(beneficiary);
  }

  void removeBeneficiaryWithNotify(BeneficiaryModel beneficiary) {
    _beneficiaries.remove(beneficiary);
    notifyListeners();
  }

  void removeBeneficiary(BeneficiaryModel beneficiary) {
    _beneficiaries.remove(beneficiary);
  }

  void updateBeneficiaries(List<BeneficiaryModel> updatedBeneficiaries) {
    _beneficiaries.clear();
    for (var beneficiary in updatedBeneficiaries) {
      _beneficiaries.add(beneficiary);
    }
  }
}

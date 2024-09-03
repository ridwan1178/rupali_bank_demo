import 'package:rupali_bank_demo/models/cards_model.dart';
import 'package:rupali_bank_demo/models/dps_model.dart';
import 'package:rupali_bank_demo/models/fd_model.dart';
import 'package:rupali_bank_demo/models/general_savings_model.dart';
import 'package:rupali_bank_demo/models/loan_model.dart';

class HomepageTestModels {
  static List<GeneralSavingsModel> gsModelList = [
    GeneralSavingsModel("BDT 64000", "BDT 32000", "BDT 16000", "BDT 8000"),
    GeneralSavingsModel("BDT 640000", "BDT 320000", "BDT 160000", "BDT 80000"),
    GeneralSavingsModel(
        "BDT 6400000", "BDT 3200000", "BDT 1600000", "BDT 800000")
  ];

  static List<LoanModel> lnModelList = [
    LoanModel(
        "BDT 69000", "6 Sep 2022", "6", "9 June 2023", "1000%", "Unclassified"),
    LoanModel(
        "BDT 6900", "7 Jan 2022", "4", "9 July 2022", "100%", "Unclassified"),
    LoanModel(
        "BDT 690", "3 Feb 2022", "2", "5 Mar 2022", "10%", "Unclassified"),
    LoanModel(
        "BDT 69", "29 Aug 2022", "0", "25 Dec 2022", "1%", "Unclassified"),
  ];

  static List<DpsModel> dpsModelList = [
    DpsModel("BDT 42000", "6 Sep 2022", "6", "9 June 2023", "1800000", "50"),
    DpsModel("BDT 4200", "7 Jan 2022", "4", "9 July 2022", "1300000", "60"),
    DpsModel("BDT 420", "3 Feb 2022", "2", "5 Mar 2022", "1700000", "40"),
  ];

  static List<FdModel> fdModelList = [
    FdModel("BDT 42000", "24 Sep 2020", "6", "2.3", "500%", "6 Sep 2022"),
    FdModel("BDT 4200", "17 Jan 2020", "4", "5.5", "260%", "7 Jan 202"),
  ];

  static List<CardsModel> cdModelList = [
    CardsModel("BDT 64000", "6 Sep 2022", "BDT 16000", "BDT 8000"),
    CardsModel("BDT 640000", "7 Jan 2022", "BDT 160000", "BDT 80000"),
    CardsModel("BDT 6400000", "3 Feb 2022", "BDT 1600000", "BDT 800000"),
    CardsModel("BDT 6400000", "24 Sep 2020", "BDT 1600000", "BDT 800000"),
    CardsModel("BDT 6400000", "17 Jan 2020", "BDT 1600000", "BDT 800000")
  ];
}

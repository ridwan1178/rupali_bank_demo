import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/home_page/components/card/card_body.dart';
import 'package:rupali_bank_demo/core/configs/app_attribute_constants.dart';
import 'package:rupali_bank_demo/home_page/components/details/general_savings_details.dart';
import 'package:rupali_bank_demo/home_page/components/highlights/abstract_highlights.dart';
import 'package:rupali_bank_demo/home_page/components/highlights/cards_highlights.dart';
import 'package:rupali_bank_demo/home_page/components/highlights/dps_highlights.dart';
import 'package:rupali_bank_demo/home_page/components/highlights/fixed_deposit_highlights.dart';
import 'package:rupali_bank_demo/home_page/components/highlights/general_savings_highlights.dart';
import 'package:rupali_bank_demo/home_page/components/highlights/loans_highlights.dart';
import 'package:rupali_bank_demo/models/tests/homepage_test_models.dart';

class HomepageAccountStatementProvider extends ChangeNotifier {
  //variables
  static List<CardBody> _cards = [];
  Widget _details = SizedBox.shrink();
  List<Widget> _highlights = [];
  Key _refreshKey = UniqueKey();
  bool _updateFlag = false;
  String _detailsFlag = "";
  List<String> optionsFlagList = ["GS", "FD", "DPS", "LOAN", "CARDS"];
  String _optionsFlag = "";
  String _error = "";

//getters
  List<CardBody> get cards => _cards;
  Widget get details => _details;
  Key get refreshKey => _refreshKey;
  bool get updateFlag => _updateFlag;
  String get detailsFlag =>
      _detailsFlag; //how the account details page should look
  String get error => _error;
  List<Widget> get highlights => _highlights;

//internal methods
//update pagecount to model obj when using api
  void _addCard(int pageCount, Color color, List<Widget> highlights) {
    _cards.clear();
    _highlights.clear();
    _highlights = highlights;
    _refreshKey = UniqueKey();

    for (var i = 0; i < pageCount; i++) {
      cards.add(CardBody(
        startColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        endColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ));
      // _highlights.add(highlightsType);
    }
  }

  // void _addDetails(String? text, int? items) {
  //   if (items != null) {
  //     for (var i = 0; i < items; i++) {
  //       _details.add(text);
  //     }
  //   }
  // }

  void setDetailsFlag(String constant) {
    _detailsFlag = constant;
  }

  void setUpdateFlag(bool flag) {
    _updateFlag = flag;
  }

  void setOptionsFlag(int index) {
    _optionsFlag = optionsFlagList[index];
  }

  void setError(String text) {
    _error = text;
  }

  void clearError() {
    _error = "";
  }

//methods being called without listeners
  void clearUpdateFlag() {
    _updateFlag = false;
  }

  void clearDetailsFlag() {
    _detailsFlag = "";
  }

//savings without listener
  void selectedDefault() {
    setUpdateFlag(false);
    setOptionsFlag(0);
    setDetailsFlag(AppAttributeConstants.generalSavings);
    List<GeneralSavingsHighlights> gs = [];
    for (int i = 0; i < 3; i++) {
      gs.add(GeneralSavingsHighlights(
          key: UniqueKey(), gsData: HomepageTestModels.gsModelList[i]));
    }
    // _highlights = GeneralSavingsHighlights();
    _addCard(3, Colors.red, gs);
    _details = GeneralSavingsDetails();
  }

//listeners

  void selectedSavings() {
    setUpdateFlag(true);
    setOptionsFlag(0);
    setDetailsFlag(AppAttributeConstants.generalSavings);
    List<GeneralSavingsHighlights> gs = [];
    for (int i = 0; i < 3; i++) {
      gs.add(GeneralSavingsHighlights(
          key: UniqueKey(), gsData: HomepageTestModels.gsModelList[i]));
    }
    _addCard(3, Colors.red, gs);
    _details = GeneralSavingsDetails();
    // _highlights = GeneralSavingsHighlights();
    notifyListeners();
  }

  void selectedFD() {
    setUpdateFlag(true);
    setOptionsFlag(1);
    setDetailsFlag(AppAttributeConstants.fixedDeposit);
    List<FixedDepositHighlights> fd = [];
    for (int i = 0; i < 2; i++) {
      fd.add(FixedDepositHighlights(
        key: UniqueKey(),
        fdData: HomepageTestModels.fdModelList[i],
      ));
    }
    _addCard(2, Colors.blue, fd);
    //_highlights = FixedDepositHighlights();
    notifyListeners();
  }

  void selectedDPS() {
    setUpdateFlag(true);
    setOptionsFlag(2);
    setDetailsFlag(AppAttributeConstants.dps);
    List<DpsHighlights> dps = [];
    for (int i = 0; i < 3; i++) {
      dps.add(DpsHighlights(
        key: UniqueKey(),
        dpsData: HomepageTestModels.dpsModelList[i],
      ));
    }
    _addCard(3, Colors.yellow, dps);
    //_highlights = DpsHighlights();
    notifyListeners();
  }

  void selectedLoan() {
    setUpdateFlag(true);
    setOptionsFlag(3);
    setDetailsFlag(AppAttributeConstants.loan);
    List<LoansHighlights> ln = [];
    for (int i = 0; i < 4; i++) {
      ln.add(LoansHighlights(
        key: UniqueKey(),
        lnData: HomepageTestModels.lnModelList[i],
      ));
    }
    _addCard(4, Colors.purple, ln);
    //_highlights = LoansHighlights();
    notifyListeners();
  }

  void selectedCards() {
    setUpdateFlag(true);
    setOptionsFlag(4);
    setDetailsFlag(AppAttributeConstants.cards);
    List<CardsHighlights> cd = [];
    for (int i = 0; i < 5; i++) {
      cd.add(CardsHighlights(
        key: UniqueKey(),
        cdData: HomepageTestModels.cdModelList[i],
      ));
    }
    _addCard(5, Colors.cyan, cd);
    //_highlights = CardsHighlights();
    notifyListeners();
  }

//not being used
  // void getDetails() {
  //   String? text;
  //   int? items;
  //   if (optionsFlagList[0] == _optionsFlag) {
  //     text = "general savings ";
  //     items = 10;
  //   } else if (optionsFlagList[1] == _optionsFlag) {
  //     text = "fixed deposit ";
  //     items = 9;
  //   } else if (optionsFlagList[2] == _optionsFlag) {
  //     text = "DPS Dps dPS ";
  //     items = 8;
  //   } else if (optionsFlagList[3] == _optionsFlag) {
  //     text = "loan LOAN lOAn ";
  //     items = 7;
  //   } else if (optionsFlagList[4] == _optionsFlag) {
  //     text = "card CArd cARd ";
  //     items = 10;
  //   } else {
  //     setError("Selected option not found");
  //   }

  //   _addDetails(text, items);
  // }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/homepage/card/card_body.dart';
import 'package:rupali_bank_demo/core/configs/app_attribute_constants.dart';
import 'package:rupali_bank_demo/homepage/highlights/cards_highlights.dart';
import 'package:rupali_bank_demo/homepage/highlights/dps_highlights.dart';
import 'package:rupali_bank_demo/homepage/highlights/fixed_deposit_highlights.dart';
import 'package:rupali_bank_demo/homepage/highlights/general_savings_highlights.dart';
import 'package:rupali_bank_demo/homepage/highlights/loans_highlights.dart';


class HomepageAccountStatementProvider extends ChangeNotifier {
  //variables
  List<CardBody> _cards = [];
  List<dynamic> _details = [];
  Widget _highlights = SizedBox.shrink();
  Key _refreshKey = UniqueKey();
  bool _updateFlag = false;
  String _detailsFlag = "";
  List<String> optionsFlagList = ["GS", "FD", "DPS", "LOAN", "CARDS"];
  String _optionsFlag = "";
  String _error = "";

//getters
  List<CardBody> get cards => _cards;
  Key get refreshKey => _refreshKey;
  bool get updateFlag => _updateFlag;
  String get detailsFlag =>
      _detailsFlag; //how the account details page should look
  String get error => _error;
  Widget get highlights => _highlights;

//internal methods
  void _addCard(int pageCount, Color color) {
    _cards.clear();
    _refreshKey = UniqueKey();

    for (var i = 0; i < pageCount; i++) {
      cards.add(CardBody(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ));
    }
  }

  void _addDetails(String? text, int? items) {
    if (items != null) {
      for (var i = 0; i < items; i++) {
        _details.add(text);
      }
    }
  }

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
    _highlights = GeneralSavingsHighlights();
    _addCard(1, Colors.red);
  }

//listeners

  void selectedSavings() {
    setUpdateFlag(true);
    setOptionsFlag(0);
    setDetailsFlag(AppAttributeConstants.generalSavings);
    _addCard(1, Colors.red);
    _highlights = GeneralSavingsHighlights();
    notifyListeners();
  }

  void selectedFD() {
    setUpdateFlag(true);
    setOptionsFlag(1);
    setDetailsFlag(AppAttributeConstants.fixedDeposit);
    _addCard(2, Colors.blue);
    _highlights = FixedDepositHighlights();
    notifyListeners();
  }

  void selectedDPS() {
    setUpdateFlag(true);
    setOptionsFlag(2);
    setDetailsFlag(AppAttributeConstants.dps);
    _addCard(3, Colors.yellow);
    _highlights = DpsHighlights();
    notifyListeners();
  }

  void selectedLoan() {
    setUpdateFlag(true);
    setOptionsFlag(3);
    setDetailsFlag(AppAttributeConstants.loan);
    _addCard(4, Colors.purple);
    _highlights = LoansHighlights();
    notifyListeners();
  }

  void selectedCards() {
    setUpdateFlag(true);
    setOptionsFlag(4);
    setDetailsFlag(AppAttributeConstants.cards);
    _addCard(5, Colors.cyan);
    _highlights = CardsHighlights();
    notifyListeners();
  }

  void getDetails() {
    String? text;
    int? items;
    if (optionsFlagList[0] == _optionsFlag) {
      text = "general savings ";
      items = 10;
    } else if (optionsFlagList[1] == _optionsFlag) {
      text = "fixed deposit ";
      items = 9;
    } else if (optionsFlagList[2] == _optionsFlag) {
      text = "DPS Dps dPS ";
      items = 8;
    } else if (optionsFlagList[3] == _optionsFlag) {
      text = "loan LOAN lOAn ";
      items = 7;
    } else if (optionsFlagList[4] == _optionsFlag) {
      text = "card CArd cARd ";
      items = 10;
    } else {
      setError("Selected option not found");
    }

    _addDetails(text, items);
  }
}

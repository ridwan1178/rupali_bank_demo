import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/homepage/card/card_body.dart';

class HomepageAccountStatementProvider extends ChangeNotifier {
  List<CardBody> _cards = [];
  Key _refreshKey = UniqueKey();
  bool _flag = false;

  List<CardBody> get cards => _cards;
  Key get refreshKey => _refreshKey;
  bool get flag => _flag;

  void _addCard(int pageCount, Color color) {
    _cards.clear();
    _refreshKey = UniqueKey();
    _flag = true;
    for (var i = 0; i < pageCount; i++) {
      cards.add(CardBody(
        color: color,
      ));
    }
  }

//savings without listener
  void selectedDefault() {
    // _flag = false;
    _addCard(1, Colors.red);
  }

  void selectedSavings() {
    _addCard(1, Colors.red);
    notifyListeners();
  }

  void selectedFD() {
    _addCard(2, Colors.blue);
    notifyListeners();
  }

  void selectedDPS() {
    _addCard(3, Colors.yellow);
    notifyListeners();
  }

  void selectedLoan() {
    _addCard(4, Colors.purple);
    notifyListeners();
  }

  void selectedCards() {
    _addCard(5, Colors.cyan);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/homepage/card/card_body.dart';

class HomepageAccountStatementProvider extends ChangeNotifier {
  List<CardBody> _cards = [];

  List<CardBody> get cards => _cards;

  void _addCard(int pageCount, Color color) {
    for (var i = 0; i < pageCount; i++) {
      cards.add(CardBody(
        color: color,
      ));
    }
  }

  void selectedSavings() {
    _cards.clear();
    _addCard(1, Colors.red);
    notifyListeners();
  }

  void selectedFD() {
    _cards.clear();
    _addCard(2, Colors.blue);
    notifyListeners();
  }

  void selectedDPS() {
    _cards.clear();
    _addCard(3, Colors.yellow);
    notifyListeners();
  }

  void selectedLoan() {
    _cards.clear();
    _addCard(4, Colors.purple);
    notifyListeners();
  }

  void selectedCards() {
    _cards.clear();
    _addCard(5, Colors.cyan);
    notifyListeners();
  }
}

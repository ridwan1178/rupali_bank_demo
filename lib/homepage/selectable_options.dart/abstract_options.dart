import 'package:flutter/material.dart';

import 'package:rupali_bank_demo/homepage/card/card_body.dart';

class HomepageOptions {
  List<CardBody> _cards = [];
  late Widget _highlights;
  late final Widget _details;

  List<CardBody> get cards => _cards;

  void setCards(List<CardBody> cards) {
    _cards = cards;
  }

  Widget get highlights => _highlights;

  void setHighlights(Widget highlights) {
    _highlights = highlights;
  }

  Widget get details => _details;

  void setDetails(Widget details) {
    _details = details;
  }

  void clearAll() {
    _cards = [];
    _details = const SizedBox.shrink();
    _highlights = const SizedBox.shrink();
  }
}

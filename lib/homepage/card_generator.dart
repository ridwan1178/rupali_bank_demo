import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/homepage/card/card_body.dart';

class CardGenerator {
  Color color;
  int pageCount;

  CardGenerator(this.color, this.pageCount);

  List<CardBody> cards = [];

  void addCards(){
    for(var i= 0; i<pageCount;i++){
    cards.add(CardBody());
  }
  }

  

  
}

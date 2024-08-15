import 'package:flutter/cupertino.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});
    static const namedRoute = "cardspage";
  static const path = "/cardspage";

  @override
  Widget build(BuildContext context) {
    return const Center(child: AppIcons.cards,);
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/cards_page/cards_page.dart';


class CardsRoutes {
  static final GoRoute cardsPage = GoRoute(
      name: CardsPage.namedRoute,
      path: CardsPage.path,
      builder: (BuildContext context, GoRouterState state) {
        return const CardsPage();
      },
    );
}

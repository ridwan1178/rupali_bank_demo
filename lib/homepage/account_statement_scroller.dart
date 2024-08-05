import 'package:flutter/material.dart';

import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';
import 'package:provider/provider.dart';

class AccountStatementScroller {
  final BuildContext context;

  AccountStatementScroller(this.context);

  List<TextButton> options = [];

  List<TextButton> addOptions() {
    return options = [
      TextButton(
          onPressed: () => {
                context
                    .read<HomepageAccountStatementProvider>()
                    .selectedSavings()
              },
          child: Text("Savings")),
      TextButton(
          onPressed: () =>
              {context.read<HomepageAccountStatementProvider>().selectedFD()},
          child: Text("FD")),
      TextButton(
          onPressed: () =>
              {context.read<HomepageAccountStatementProvider>().selectedDPS()},
          child: Text("DPS")),
      TextButton(
          onPressed: () =>
              {context.read<HomepageAccountStatementProvider>().selectedLoan()},
          child: Text("Loans")),
      TextButton(
          onPressed: () => {
                context.read<HomepageAccountStatementProvider>().selectedCards()
              },
          child: Text("Cards")),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rupali_bank_demo/homepage/account_statement_scroller.dart';
import 'package:rupali_bank_demo/homepage/widget_scroller.dart';
import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    List<TextButton> options = AccountStatementScroller(context).addOptions();

    return SafeArea(
        child: Scaffold(
      appBar: const BasicAppbar(hideBackButton: true),
      body: Consumer<HomepageAccountStatementProvider>(
        builder: (BuildContext context, HomepageAccountStatementProvider value,
            Widget? child) {
          return Column(
            children: [
              WidgetScroller(
                showDots: true,
                value: value,
              ),
              WidgetScroller(options: options, showDots: false, value: value),
              const Row(
                children: [Placeholder()],
              )
            ],
          );
        },
      ),
    ));
  }
}

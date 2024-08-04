import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/homepage/card_section.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      appBar: BasicAppbar(hideBackButton: true),
      body: Column(
        children: [
          CardSection(),
          Row(
            children: [Placeholder()],
          )
        ],
      ),
    ));
  }
}

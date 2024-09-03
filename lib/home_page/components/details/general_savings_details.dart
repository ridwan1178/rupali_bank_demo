import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/main.dart';

class GeneralSavingsDetails extends StatelessWidget {
  const GeneralSavingsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ppc.cw(20),
      ),
      child: SizedBox(
        height: ppc.ch(378),
        width: ppc.cw(333),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  
                  TabBar(
                    padding: EdgeInsets.all(0),
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.unSelected,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    indicatorSize: null,
                    tabs: [
                      Tab(text: "Year"),
                      Tab(text: "Month"),
                      Tab(text: "Week"),
                    ],
                  )
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(top: ppc.ch(12)),
              child: SizedBox(
                height: ppc.ch(378),
        width: ppc.cw(333),
                child: TabBarView(
                  children: [Placeholder(), Placeholder(), Placeholder()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

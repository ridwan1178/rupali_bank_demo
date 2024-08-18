import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/transfers/components/fund_transfer_options.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class TransfersPage extends StatelessWidget {
  const TransfersPage({super.key});
  static const namedRoute = "transferspage";
  static const path = "/transfersspage";

  @override
  Widget build(BuildContext context) {
    var pageTitle = PageTitleWiget("Fund Transfer");
    return Scaffold(
        appBar: BasicAppbar(
          hideBackButton: false,
          title: pageTitle.pageTitle(),
          centerTitle: pageTitle.centerTitle,
        ),
        body: Center(
          child: gridView(context)
        ));
  }

    Widget gridView(BuildContext context) {
    //List<Widget> items = [];
    // for (var i = 0; i < count; i++) {
    //   items.add(Container(
    //     height: 45,
    //     width: 75,
    //     decoration: BoxDecoration(
    //       color: const Color.fromARGB(15, 46, 156, 220),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     child: const Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [Text("Total withdrawal"), Text("420k")],
    //     ),
    //   ));
    // }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.count(
        childAspectRatio: 1.5, //1.81,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: FundTransferOptions(context).getOptions()
      
        
      ),
    );
  }
}

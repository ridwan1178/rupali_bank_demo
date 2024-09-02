import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_constants.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/home_page/components/highlights/abstract_highlights.dart';
import 'package:rupali_bank_demo/home_page/components/items/item.dart';
import 'package:rupali_bank_demo/home_page/components/maps/icon_maps.dart';
import 'package:rupali_bank_demo/home_page/components/maps/title_maps.dart';
import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/models/general_savings_model.dart';

class GeneralSavingsHighlights
    extends StatefulWidget //implements AbstractHighlights
{
  //final  List<dynamic> data;
  final Key _refreshKey = UniqueKey();
  Key get refreshKey => _refreshKey;

  final GeneralSavingsModel? gsData;

  GeneralSavingsHighlights({super.key, this.gsData});

  @override
  State<GeneralSavingsHighlights> createState() =>
      _GeneralSavingsHighlightsState();
}

class _GeneralSavingsHighlightsState extends State<GeneralSavingsHighlights> {
  bool fade = true;

  Map<int, String> dataMap = {
    0: AppConstants.tDeposit,
    1: AppConstants.tWithdraw,
    2: AppConstants.tPay,
    3: AppConstants.tTrans
  };

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        fade = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: fade ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 500),
        child: highlights());
  }

  Widget highlights() {
    return Padding(
      padding: EdgeInsets.only(top: ppc.ch(14)),
      child: SizedBox(
        height: ppc.ch(350),
        width: ppc.cw(333),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              flexibleSpace: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
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
              child: TabBarView(
                children: [gridView(4), gridView(5), gridView(4)],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget gridView(int count) {
    List<Widget> items = [];
    for (var i = 0; i < count; i++) {
      items.add(Item().itemGenerator(
              TitleMaps.gsMap[dataMap[i]] ?? "Error",
              IconMaps.gsIconMap[dataMap[i]] ?? AppIcons.cmnInfoError,
              widget.gsData!.data[dataMap[i]] ?? "No data")
          //   Container(
          //   height: ppc.ch(88),
          //   width: ppc.cw(162),
          //   decoration: BoxDecoration(
          //     color: const Color.fromARGB(15, 46, 156, 220),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: const Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [Text("Total withdrawal"), Text("420k")],
          //   ),
          // )
          );
    }
    return SizedBox(
      height: ppc.ch(305),
      width: ppc.cw(333),
      child: GridView.count(
          childAspectRatio: 1.5, //1.81,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: items),
    );
  }
}

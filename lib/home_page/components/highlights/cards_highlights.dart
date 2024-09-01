import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/main.dart';

import 'package:rupali_bank_demo/utils/animations/container_cross_swap.dart';

class CardsHighlights extends StatefulWidget {
  //final  List<dynamic> data;
  const CardsHighlights({super.key});

  @override
  State<CardsHighlights> createState() => _CardsHighlightsState();
}

class _CardsHighlightsState extends State<CardsHighlights> {
  bool animate = true;
  bool fadeIn = true;
  bool unFixPosition = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        fadeIn = false;
      });
      print(' widget binding : $fadeIn');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return highlights();
  }

  Widget highlights() {
    return SizedBox(
        height: ppc.ch(350),
      width: ppc.cw(333),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              flexibleSpace: ColoredBox(
                color: Colors.white,
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: fadeIn
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: const SizedBox.shrink(),
                  secondChild: TabBar(
                    onTap: (index) {
                      setState(() {
                        animate = false;
                        unFixPosition = false;
                      });
                    },
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.green,
                    indicator: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    dividerHeight: null,
                    tabs: const [
                      Tab(
                        text: "BDT",
                      ),
                      Tab(
                        text: "USD",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Padding(
              padding:  EdgeInsets.only(top: ppc.ch(13)),
              child: TabBarView(
                children: [
                  ContainerCrossSwap(
                    selector: animate,
                    unFixPosition: unFixPosition,
                  ),
                   const ContainerCrossSwap(
                    selector: false,
                    unFixPosition: false,
                  )
                ],
              ),
            ),
          ),
        ),
      
    );
  }


}

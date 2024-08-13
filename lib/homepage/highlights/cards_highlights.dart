import 'package:flutter/material.dart';

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
  bool fixPosition = true;

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
    return Expanded(
      child: SizedBox(
        height: 350,
        width: 333,
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
                        fixPosition = false;
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
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TabBarView(
                children: [
                  ContainerCrossSwap(
                    selector: animate,
                    fixPosition: fixPosition,
                  ),
                   const ContainerCrossSwap(
                    selector: false,
                    fixPosition: false,
                  )
                ],
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
      items.add(Container(
        height: 45,
        width: 75,
        decoration: BoxDecoration(
          color: const Color.fromARGB(15, 46, 156, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Total withdrawal"), Text("420k")],
        ),
      ));
    }
    return GridView.count(
        childAspectRatio: 1.5, //1.81,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: items);
  }
}

import 'package:flutter/material.dart';


class LoansHighlights extends StatelessWidget {
  //final  List<dynamic> data;
  const LoansHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(height: 350, width: 333, child: gridView(6)),
    );
  }

  Widget highlights() {
    return Expanded(
      child: SizedBox(
        height: 305,
        width: 333,
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
                    // padding: EdgeInsets.all(4),
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
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TabBarView(
                children: [gridView(4), gridView(5), gridView(3)],
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
      children: items
        // Container(
        //   height: 45,
        //   width: 75,
        //   decoration: BoxDecoration(
        //     color: const Color.fromARGB(15, 46, 156, 220),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: const Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [Text("Total withdrawal"), Text("420k")],
        //   ),
        // ),
        // SizedBox(
        //   height: 45,
        //   width: 90,
        //   child: ColoredBox(color: Colors.blueGrey),
        // ),
        // Container(
        //   height: 45,
        //   width: 75,
        //   color: Colors.blueGrey,
        // ),
        // Container(
        //   color: Colors.blueGrey,
        // ),
        // Container(
        //   height: 45,
        //   width: 75,
        //   color: Colors.blueGrey,
        // )
      
    );
  }
}

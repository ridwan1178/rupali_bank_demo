import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CardsHighlights extends StatelessWidget {
  //final  List<dynamic> data;
  const CardsHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return highlights();
  }

  Widget highlights() {
    return Expanded(
      child: SizedBox(
        height: 305,
        width: 333,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              flexibleSpace: const  ColoredBox(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    
                      TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.green,
                        indicator: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(10))),
                        indicatorSize: TabBarIndicatorSize.tab,
                        // padding: EdgeInsets.all(4),
                        dividerColor: Colors.transparent,
                        //indicatorColor: Colors.transparent,
                        
                        tabs: [
                          Tab(text: "BDT",),
                          Tab(text: "USD",),
                          
                        ],
                      ),
                    
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TabBarView(
                children: [gridView(4), gridView(4)],
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

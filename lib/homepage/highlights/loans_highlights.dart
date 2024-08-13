import 'package:flutter/material.dart';

class LoansHighlights extends StatefulWidget {
  //final  List<dynamic> data;
  const LoansHighlights({super.key});

  @override
  State<LoansHighlights> createState() => _LoansHighlightsState();
}

class _LoansHighlightsState extends State<LoansHighlights> {
  bool fade = true;

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
    return Expanded(
      child: SizedBox(
          height: 350, width: 333, child: AnimatedOpacity(
            opacity: fade ? 0.0:1.0,
            duration: const  Duration(milliseconds: 500),
            child: gridView(6))),
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
        

        );
  }
}

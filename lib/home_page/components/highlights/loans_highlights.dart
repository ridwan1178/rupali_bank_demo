import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/main.dart';

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
    return SizedBox(
            height: ppc.ch(305), width: ppc.cw(333), child: AnimatedOpacity(
              opacity: fade ? 0.0:1.0,
              duration: const  Duration(milliseconds: 500),
              child: gridView(6))
      
    );
  }


  Widget gridView(int count) {
    List<Widget> items = [];
    for (var i = 0; i < count; i++) {
      items.add(Container(
        height: ppc.ch(97),
        width: ppc.cw(162),
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
        childAspectRatio: 1.67,//1.5, //1.81,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(0),
        children: items
        

        );
  }
}

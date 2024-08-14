import 'package:flutter/material.dart';


class DpsHighlights extends StatefulWidget {
  //final  List<dynamic> data;
  const DpsHighlights({super.key});

  @override
  State<DpsHighlights> createState() => _DpsHighlightsState();
}

class _DpsHighlightsState extends State<DpsHighlights> {
  bool fade = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        fade = false;
        selected = true;
      });
      print(' widget binding : $selected');
    });
    super.initState();
  }

  static const Duration duration = Duration(milliseconds: 700);
  static const Curve curve = Curves.fastOutSlowIn;
  static const double height = 110;
  static const double width = 162;
  static const double top = 115;
  static const double left = 170;

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 333,
      child: Stack(
        children: <Widget>[
          fadetransitionContainer(0, left),
          fadetransitionContainer(0, 0),
          //1st type
          AnimatedPositioned(
            width: width,
            height: height,
            top: selected ? top : top * 2,
            left: selected ? left : 0,
            
            duration: duration,
            curve: curve,
            child:item(),
              
            
          ),
          //2nd type
          AnimatedPositioned(
            width: width,
            height: height,
            top: selected ? top * 2 : top,
            left: selected ? left : 0,
            
            duration: duration,
            curve: curve,
            child: item(),
              
            
          ),
          //1st type
          AnimatedPositioned(
            width: width,
            height: height,
            //top: selected ?50.0 : 0.0,
            top: selected ? top * 2 : top,
            left: selected ? 0 : left,
            // left: selected ? 0 : 100,
            duration: duration,
            curve: curve,
            child:item(),
              
          ),
          //2nd type
          AnimatedPositioned(
            width: width,
            height: height,
            top: testTop(selected, top),
            left: selected ? 0 : left,
            //right: selected ? 0 : 100,
            duration: duration,
            curve: curve,
            child: item(),
              
            
          ),
        ],
      ),
    );
  }

  double testTop(bool test, double top) {
    return test ? top : top * 2;
  }

  Widget item() {
    return Container(
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
    );
  }

  Widget fadetransitionContainer(double top, double left) {
    return Positioned(
        height: height,
        width: width,
        top: top,
        left: left,
        child: AnimatedOpacity(
          opacity: fade ? 0.0 : 1.0,
          duration: duration,
          child: item(),
        ));
  }
}

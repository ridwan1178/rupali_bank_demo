import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_constants.dart';
import 'package:rupali_bank_demo/main.dart';

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

    Map<int, String> dataMap = {
    0: AppConstants.instAmnt,
    1: AppConstants.nextInst,
    2: AppConstants.matAmnt,
    3: AppConstants.matDate,
    4: AppConstants.tInst,
    5: AppConstants.instPending,
  };

  static const Duration duration = Duration(milliseconds: 700);
  static const Curve curve = Curves.fastOutSlowIn;
  double height = ppc.ch(110);
  double width = ppc.cw(162);
  double top = ppc.ch(115);
  double left = ppc.cw(170);

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ppc.ch(350),
      width: ppc.cw(333),
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
            child: item(),
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
            child: item(),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        height: ppc.ch(88),
        width: ppc.cw(162),
        decoration: BoxDecoration(
          color: const Color.fromARGB(15, 46, 156, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Total withdrawal"), Text("420k")],
        ),
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

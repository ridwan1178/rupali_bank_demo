import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/main.dart';

class ContainerCrossSwap extends StatefulWidget {
  const ContainerCrossSwap({
    super.key,
    this.selector,
    required this.unFixPosition,
  });

  final bool? selector;
  final bool unFixPosition;

  @override
  State<ContainerCrossSwap> createState() => _ContainerCrossSwapState();
}

class _ContainerCrossSwapState extends State<ContainerCrossSwap> {
  bool fade = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selected = widget.selector ?? true;
        fade = true;
      });
      print(' widget binding : $selected');
    });
    super.initState();
  }

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
          fadetransitionContainer(top, left),
          fadetransitionContainer(top, 0),
          //1st type
          AnimatedPositioned(
            width: width,
            height: height,
            top: widget.unFixPosition ? (selected ? top : top * 2) : top,
            left: widget.unFixPosition ? (selected ? left : 0) : left,
            duration: duration,
            curve: curve,
            child: item(),
          ),
          //2nd type
          AnimatedPositioned(
            width: width,
            height: height,
            top: 0,
            left: 0,
            duration: duration,
            curve: curve,
            child: item(),
          ),
          //1st type
          AnimatedPositioned(
            width: width,
            height: height,
            top: 0,
            left: left,
            duration: duration,
            curve: curve,
            child: item(),
          ),

          //2nd type
          AnimatedPositioned(
            width: width,
            height: height,
            top: widget.unFixPosition ? (selected ? top : top * 2) : top,
            left: widget.unFixPosition ? (selected ? 0 : left) : 0,
            duration: duration,
            curve: curve,
            child: item(),
          ),
        ],
      ),
    );
  }

// set top for animation position
  double testTop(bool test, double top) {
    return test ? top : top * 2;
  }

  Widget item() {
    return Container(
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
    );
  }

  Widget fadetransitionContainer(double top, double left) {
    return Positioned(
        height: ppc.ch(88),
      width: ppc.cw(162),
        top: top,
        left: left,
        child: AnimatedOpacity(
          opacity: widget.unFixPosition ? (fade ? 0.0 : 1.0) : 0,
          duration: duration,
          child: item(),
        ));
  }
}

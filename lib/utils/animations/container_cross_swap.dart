import 'package:flutter/material.dart';

class ContainerCrossSwap extends StatefulWidget {
  const ContainerCrossSwap({
    super.key,
    this.selector,
    required this.fixPosition,
  });

  final bool? selector;
  final bool fixPosition;

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
          fadetransitionContainer(top, left),
          fadetransitionContainer(top, 0),
          //1st type
          AnimatedPositioned(
            width: width,
            height: height,
            top: widget.fixPosition ? (selected ? top : top * 2) : top,
            left: widget.fixPosition ? (selected ? left : 0) : left,
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
            top: widget.fixPosition ? (selected ? top : top * 2) : top,
            left: widget.fixPosition ? (selected ? 0 : left) : 0,
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
      height: height,
      width: width,
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
          opacity: widget.fixPosition ? (fade ? 0.0 : 1.0) : 0,
          duration: duration,
          child: item(),
        ));
  }
}

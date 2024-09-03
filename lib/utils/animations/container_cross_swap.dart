import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/home_page/components/items/item.dart';
import 'package:rupali_bank_demo/home_page/components/maps/icon_maps.dart';
import 'package:rupali_bank_demo/home_page/components/maps/title_maps.dart';
import 'package:rupali_bank_demo/main.dart';

class ContainerCrossSwap extends StatefulWidget {
  const ContainerCrossSwap({
    super.key,
    required this.animate,
    required this.unFixPosition,
    required this.dataMap,
    required this.modelData,
  });

  final bool animate;
  final bool unFixPosition;
  final Map<int, String> dataMap;
  final Map<String, String> modelData;

  @override
  State<ContainerCrossSwap> createState() => _ContainerCrossSwapState();
}

class _ContainerCrossSwapState extends State<ContainerCrossSwap> {
  bool fade = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        animate = widget.animate;
        fade = true;
      });
      print(' widget binding : $animate');
    });
    super.initState();
  }

  static const Duration duration = Duration(milliseconds: 700);
  static const Curve curve = Curves.fastOutSlowIn;
  double height = ppc.ch(110);
  double width = ppc.cw(162);
  double top = ppc.ch(115);
  double left = ppc.cw(170);

  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ppc.ch(350),
      width: ppc.cw(333),
      child: Stack(
        children: <Widget>[
          //2-2 //fades on first build
          fadetransitionContainer(top, left, 1),
          //2-1 //fades on first build
          fadetransitionContainer(top, 0, 0),
          //3-1 > 2-2
          AnimatedPositioned(
            width: width,
            height: height,
            top: widget.unFixPosition ? (animate ? top : top * 2) : top,
            left: widget.unFixPosition ? (animate ? left : 0) : left,
            duration: duration,
            curve: curve,
            child: Item().itemGenerator(
                TitleMaps.cdMap[widget.dataMap[3]] ?? "Error",
                IconMaps.cdIconMap[widget.dataMap[3]] ?? AppIcons.cmnInfoError,
                widget.modelData[widget.dataMap[3]] ?? "No data"),
          ),
          //1-1
          AnimatedPositioned(
            width: width,
            height: height,
            top: 0,
            left: 0,
            duration: duration,
            curve: curve,
            child: Item().itemGenerator(
                TitleMaps.cdMap[widget.dataMap[0]] ?? "Error",
                IconMaps.cdIconMap[widget.dataMap[0]] ?? AppIcons.cmnInfoError,
                widget.modelData[widget.dataMap[0]] ?? "No data"),
          ),
          //1-2
          AnimatedPositioned(
            width: width,
            height: height,
            top: 0,
            left: left,
            duration: duration,
            curve: curve,
            child: Item().itemGenerator(
                TitleMaps.cdMap[widget.dataMap[1]] ?? "Error",
                IconMaps.cdIconMap[widget.dataMap[1]] ?? AppIcons.cmnInfoError,
                widget.modelData[widget.dataMap[1]] ?? "No data"),
          ),

          //3-2 > 2-1
          AnimatedPositioned(
            width: width,
            height: height,
            top: widget.unFixPosition ? (animate ? top : top * 2) : top,
            left: widget.unFixPosition ? (animate ? 0 : left) : 0,
            duration: duration,
            curve: curve,
            child: Item().itemGenerator(
                TitleMaps.cdMap[widget.dataMap[2]] ?? "Error",
                IconMaps.cdIconMap[widget.dataMap[2]] ?? AppIcons.cmnInfoError,
                widget.modelData[widget.dataMap[2]] ?? "No data"),
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

  Widget fadetransitionContainer(double top, double left, int mapIndex) {
    return Positioned(
        height: ppc.ch(88),
        width: ppc.cw(162),
        top: top,
        left: left,
        child: AnimatedOpacity(
          opacity: widget.unFixPosition ? (fade ? 0.0 : 1.0) : 0,
          duration: duration,
          child: Item().itemGenerator(
              TitleMaps.cdMap[widget.dataMap[mapIndex]] ?? "Error",
              IconMaps.cdIconMap[widget.dataMap[mapIndex]] ??
                  AppIcons.cmnInfoError,
              widget.modelData[widget.dataMap[mapIndex]] ?? "No data"),
        ));
  }
}

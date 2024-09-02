import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_constants.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/home_page/components/items/item.dart';
import 'package:rupali_bank_demo/home_page/components/maps/icon_maps.dart';
import 'package:rupali_bank_demo/home_page/components/maps/title_maps.dart';
import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/models/fd_model.dart';

class FixedDepositHighlights extends StatefulWidget {
  final FdModel fdData;
  const FixedDepositHighlights({super.key, required this.fdData});

  @override
  State<FixedDepositHighlights> createState() => _FixedDepositHighlightsState();
}

class _FixedDepositHighlightsState extends State<FixedDepositHighlights> {
  bool fade = true;
  Map<int, String> dataMap = {
    0: AppConstants.pAmnt,
    2: AppConstants.tenor,
    3: AppConstants.maturedIn,
    1: AppConstants.matDate,
    5: AppConstants.opDate,
    4: AppConstants.intRate
  };

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
          fadetransitionContainer(0, left, 1),
          fadetransitionContainer(0, 0, 0),
          //3-1 > 2-2
          AnimatedPositioned(
            width: width,
            height: height,
            top: selected ? top : top * 2,
            left: selected ? left : 0,
            duration: duration,
            curve: curve,
            child: Item().itemGenerator(
                TitleMaps.fdMap[dataMap[3]] ?? "Error",
                IconMaps.fdIconMap[dataMap[3]] ?? AppIcons.cmnInfoError,
                widget.fdData.data[dataMap[3]] ?? "No data"),
          ),
          //2-1 > 3-2
          AnimatedPositioned(
            width: width,
            height: height,
            top: selected ? top * 2 : top,
            left: selected ? left : 0,
            duration: duration,
            curve: curve,
            child: Item().itemGenerator(
                TitleMaps.fdMap[dataMap[5]] ?? "Error",
                IconMaps.fdIconMap[dataMap[5]] ?? AppIcons.cmnInfoError,
                widget.fdData.data[dataMap[5]] ?? "No data"),
          ),
          //2-2 > 3-1
          AnimatedPositioned(
            width: width,
            height: height,
            //top: selected ?50.0 : 0.0,
            top: selected ? top * 2 : top,
            left: selected ? 0 : left,
            // left: selected ? 0 : 100,
            duration: duration,
            curve: curve,
            child: Item().itemGenerator(
                TitleMaps.fdMap[dataMap[4]] ?? "Error",
                IconMaps.fdIconMap[dataMap[4]] ?? AppIcons.cmnInfoError,
                widget.fdData.data[dataMap[4]] ?? "No data"),
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
            child: Item().itemGenerator(
                TitleMaps.fdMap[dataMap[2]] ?? "Error",
                IconMaps.fdIconMap[dataMap[2]] ?? AppIcons.cmnInfoError,
                widget.fdData.data[dataMap[2]] ?? "No data"),
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
        height: height,
        width: width,
        top: top,
        left: left,
        child: AnimatedOpacity(
          opacity: fade ? 0.0 : 1.0,
          duration: duration,
          child: Item().itemGenerator(
              TitleMaps.fdMap[dataMap[mapIndex]] ?? "Error",
              IconMaps.fdIconMap[dataMap[mapIndex]] ?? AppIcons.cmnInfoError,
              widget.fdData.data[dataMap[mapIndex]] ?? "No data"),
        ));
  }
}

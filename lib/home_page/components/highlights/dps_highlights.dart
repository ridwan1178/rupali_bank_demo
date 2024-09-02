import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_constants.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/home_page/components/items/item.dart';
import 'package:rupali_bank_demo/home_page/components/maps/icon_maps.dart';
import 'package:rupali_bank_demo/home_page/components/maps/title_maps.dart';
import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/models/dps_model.dart';

class DpsHighlights extends StatefulWidget {
  final DpsModel dpsData;
  const DpsHighlights({super.key, required this.dpsData});

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
                TitleMaps.dpsMap[dataMap[3]] ?? "Error",
                IconMaps.dpsIconMap[dataMap[3]] ?? AppIcons.cmnInfoError,
                widget.dpsData.data[dataMap[3]] ?? "No data"),
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
                TitleMaps.dpsMap[dataMap[5]] ?? "Error",
                IconMaps.dpsIconMap[dataMap[5]] ?? AppIcons.cmnInfoError,
                widget.dpsData.data[dataMap[5]] ?? "No data"),
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
                TitleMaps.dpsMap[dataMap[4]] ?? "Error",
                IconMaps.dpsIconMap[dataMap[4]] ?? AppIcons.cmnInfoError,
                widget.dpsData.data[dataMap[4]] ?? "No data"),
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
                TitleMaps.dpsMap[dataMap[2]] ?? "Error",
                IconMaps.dpsIconMap[dataMap[2]] ?? AppIcons.cmnInfoError,
                widget.dpsData.data[dataMap[2]] ?? "No data"),
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
              TitleMaps.dpsMap[dataMap[mapIndex]] ?? "Error",
              IconMaps.dpsIconMap[dataMap[mapIndex]] ?? AppIcons.cmnInfoError,
              widget.dpsData.data[dataMap[mapIndex]] ?? "No data"),
        ));
  }
}

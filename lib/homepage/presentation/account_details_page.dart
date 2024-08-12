import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/homepage/presentation/homepage.dart';

class AccountDetailsPage extends StatefulWidget {
   const AccountDetailsPage({super.key, this.selector, });
  static const String namedRoute = "accountdetails";
  static const String path = "${Homepage.namedRoute}/accountdetails";
  final bool? selector;

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selected = widget.selector ?? true;
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
          //1st type
          AnimatedPositioned(
            width: width,
            height: height,
            top: selected ? 0 : top,
            left: selected ? left : 0,
            //right: selected ? 0 : 100,
            duration: duration,
            curve: curve,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: item(),
              // const ColoredBox(
              //   color: Colors.blue,
              //   child: Center(child: Text('hold me')),
              // ),
            ),
          ),
          //2nd type
          AnimatedPositioned(
            width: width,
            height: height,
            top: selected ? top  : 0,
            left: selected ? left : 0,
            //right: selected ? 0 : 100,
            duration: duration,
            curve: curve,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: item(),
              // const ColoredBox(
              //   color: Colors.blue,
              //   child: Center(child: Text('hold me')),
              // ),
            ),
          ),
          //1st type
          AnimatedPositioned(
            width: width,
            height: height,
            //top: selected ?50.0 : 0.0,
            top: selected ? top  : 0,
            left: selected ? 0 : left,
            // left: selected ? 0 : 100,
            duration: duration,
            curve: curve,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: item(),
              // const ColoredBox(
              //   color: Colors.blue,
              //   child: Center(child: Text('Tap me')),
              // ),
            ),
          ),
          //2nd type
          AnimatedPositioned(
            width: width,
            height: height,
            top: selected ?  0 : top,
            left: selected ? 0 : left,
            //right: selected ? 0 : 100,
            duration: duration,
            curve: curve,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: item(),
              // const ColoredBox(
              //   color: Colors.blue,
              //   child: Center(child: Text('hold me')),
              // ),
            ),
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
}

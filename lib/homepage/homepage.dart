import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/utils/circle_done_icon.dart';
import 'package:rupali_bank_demo/utils/dots_indicator_widget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  final int pageCount = 3;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  nextFunction() {
    currentIndex++;
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    currentIndex--;
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: BasicAppbar(hideBackButton: true),
      body: Column(
        children: [
          SizedBox(
            height: 180,
            width: 610,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => {
                setState(() {
                  currentIndex = index;
                })
              },
              scrollDirection: Axis.horizontal,
              children: [
                _cardBody(),
                _cardBody(),
                _cardBody(),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _cardBody() {
    return Column(
      children: [
        Card(
          color: AppColors.primary,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleDoneIcon(
                        height: 30,
                        width: 30,
                        icon: AppIcons.tickMark,
                        containerColor: Colors.green,
                        borderColor: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [],
              )
            ],
          ),
        ),
        DotsIndicatorWidget(currentIndex: currentIndex, pageCount: pageCount)
      ],
    );
  }
}

// class CircleDoneIcon extends StatelessWidget {
//   const CircleDoneIcon({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 30,
//       height: 30,
//       //constraints: BoxConstraints(maxHeight: 20, maxWidth: 20),
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.green,
//           border: Border.all(color: Colors.white)),
//       child: AppIcons.tickMark,
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'package:rupali_bank_demo/core/configs/app_icons.dart';

class BasicBottomNavbar extends StatefulWidget {
  BasicBottomNavbar({
    super.key,
    required this.pageController,
    this.pageIndex,
  });
  PageController? pageController;
  int? pageIndex;
  int _navBarIndex = 0;
  Key? _refeshKey;

  int get navbarIndex => _navBarIndex;
  Key? get refreshKey => _refeshKey;

  @override
  State<BasicBottomNavbar> createState() => _BasicBottomNavbarState();
}

class _BasicBottomNavbarState extends State<BasicBottomNavbar> {


  @override
  Widget build(BuildContext context) {
    if (widget.pageIndex != null) {
      widget._navBarIndex = widget.pageIndex!;
    }
    // TODO: implement build
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: AppIcons.home,
            activeIcon: AppIcons.homeActive,
            label: "Home"),
        BottomNavigationBarItem(
            icon: AppIcons.payment,
            activeIcon: AppIcons.paymentActive,
            label: "Payments"),
        BottomNavigationBarItem(
            icon: AppIcons.transfer,
            activeIcon: AppIcons.transferActive,
            label: "Transfer"),
        BottomNavigationBarItem(
            icon: AppIcons.cards,
            activeIcon: AppIcons.cardsActive,
            label: "Cards"),
        BottomNavigationBarItem(
            icon: AppIcons.services,
            activeIcon: AppIcons.servicesActive,
            label: "Services"),
      ],
      currentIndex: widget._navBarIndex,
      onTap: (currentIndex) {
        setState(() {
          if (currentIndex != widget._navBarIndex) {
            widget._navBarIndex = currentIndex;
            widget.pageController!.jumpToPage(currentIndex);
            widget._refeshKey = UniqueKey();
          }
          

          // _selectRoute(widget._navBarIndex);
        });
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/homepage/presentation/homepage.dart';

class BasicBottomNavbar extends StatefulWidget {
  const BasicBottomNavbar({super.key});

  @override
  State<BasicBottomNavbar> createState() => _BasicBottomNavbarState();
}

class _BasicBottomNavbarState extends State<BasicBottomNavbar> {
  int _navBarIndex = 0;

  void _selectRoute(int index) {
    switch (index) {
      case 0:
        context.goNamed(Homepage.namedRoute);

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: AppIcons.home, label: "Home"),
        BottomNavigationBarItem(icon: AppIcons.payment, label: "Payments"),
        BottomNavigationBarItem(icon: AppIcons.transfer, label: "Transfer"),
        BottomNavigationBarItem(icon: AppIcons.cards, label: "Cards"),
        BottomNavigationBarItem(icon: AppIcons.services, label: "Home"),
      ],
      currentIndex: _navBarIndex,
      onTap: (currentIndex) {
        setState(() {
          _navBarIndex = currentIndex;
        });
        _selectRoute(_navBarIndex);
      },
    );
  }
}

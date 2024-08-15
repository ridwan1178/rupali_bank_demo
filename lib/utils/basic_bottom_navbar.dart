import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/cards_page/cards_page.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/homepage/presentation/homepage.dart';
import 'package:rupali_bank_demo/payments/payments_page.dart';
import 'package:rupali_bank_demo/services_page/services_page.dart';
import 'package:rupali_bank_demo/transfers/transfers_page.dart';

class BasicBottomNavbar extends StatefulWidget {
  BasicBottomNavbar(
      {super.key, required this.pageController, this.pageIndex});
  PageController? pageController;
  int? pageIndex;
  int _navBarIndex = 0;
  // final GlobalKey<State<StatefulWidget>> widgetKey =
  //     GlobalKey<State<StatefulWidget>>();
  // static Widget? _build;

  // static Widget get build{
  //   return _build ??=
  // }
  int get navbarIndex => _navBarIndex;

  @override
  State<BasicBottomNavbar> createState() => _BasicBottomNavbarState();
}

class _BasicBottomNavbarState extends State<BasicBottomNavbar> {
  void _selectRoute(int index) {
    switch (index) {
      case 0:
        context.pushReplacementNamed(Homepage.namedRoute);
      case 1:
        context.goNamed(PaymentsPage.namedRoute);
      case 2:
        context.goNamed(TransfersPage.namedRoute);
      case 3:
        context.goNamed(CardsPage.namedRoute);
      case 4:
        context.goNamed(ServicesPage.namedRoute);

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
        BottomNavigationBarItem(icon: AppIcons.services, label: "Services"),
      ],
      currentIndex: widget._navBarIndex,
      onTap: (currentIndex) {
        setState(() {
          widget._navBarIndex = currentIndex;
          widget.pageController!.jumpToPage(currentIndex);
          // _selectRoute(widget._navBarIndex);
        });
      },
    );
  }
}

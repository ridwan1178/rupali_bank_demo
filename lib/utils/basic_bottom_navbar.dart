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
  const BasicBottomNavbar({super.key});
  

  @override
  State<BasicBottomNavbar> createState() => _BasicBottomNavbarState();
}

class _BasicBottomNavbarState extends State<BasicBottomNavbar> {

  
  int _navBarIndex = 0;

  void _selectRoute(int index){
    switch (index) {
      case 0: context.pushReplacementNamed(Homepage.namedRoute);
      case 1: context.goNamed(PaymentsPage.namedRoute);
      case 2: context.goNamed(TransfersPage.namedRoute);
      case 3: context.goNamed(CardsPage.namedRoute);
      case 4: context.goNamed(ServicesPage.namedRoute);
        
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
      currentIndex: _navBarIndex,
      onTap: (currentIndex) {
        setState(() {
          _navBarIndex = currentIndex;
          _selectRoute(_navBarIndex);
        });
        
      },
    );
  }
}

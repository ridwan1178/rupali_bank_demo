import 'package:flutter/cupertino.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

    static const namedRoute = "servicesspage";
  static const path = "/servicespage";

  @override
  Widget build(BuildContext context) {
    return const Center(child: AppIcons.services,);
  }
}
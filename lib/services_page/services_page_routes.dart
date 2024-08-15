import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/services_page/services_page.dart';

class ServicesRoutes {
  static final GoRoute servicesPage = GoRoute(
    name: ServicesPage.namedRoute,
    path: ServicesPage.path,
    builder: (BuildContext context, GoRouterState state) {
      return const ServicesPage();
    },
  );
}

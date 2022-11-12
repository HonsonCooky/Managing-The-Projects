import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/presentation/unknown_route_page.dart';
import 'package:managing_the_projects/home/presentation/home_page.dart';

enum MtpRoute {
  home,
  settings,
  tables,
  chores,
}

extension MtpRouteExt on MtpRoute {
  IconData getIcon() {
    switch (this) {
      case MtpRoute.home:
        return Icons.home;
      case MtpRoute.settings:
        return Icons.settings;
      case MtpRoute.tables:
        return Icons.table_chart;
      case MtpRoute.chores:
        return Icons.local_laundry_service;
    }
  }
}

Widget _getRoutePage(String? pageName) {
  var route = MtpRoute.values.firstWhere((element) => element.name == pageName);
  switch (route) {
    case MtpRoute.home:
      return const HomePage();
    case MtpRoute.settings:
      break;
    case MtpRoute.tables:
      break;
    case MtpRoute.chores:
      break;
  }
  return const UnknownRoutePage();
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  var page = _getRoutePage(settings.name);
  return MaterialPageRoute(settings: settings, builder: (context) => page);
}

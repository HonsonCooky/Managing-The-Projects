import 'package:flutter/material.dart';
import 'package:managing_the_projects/authentication/presentation/login_page.dart';
import 'package:managing_the_projects/common/model/theme_model.dart';
import 'package:managing_the_projects/common/presentation/mtp_fragment.dart';
import 'package:managing_the_projects/common/presentation/unknown_route_page.dart';
import 'package:managing_the_projects/home/presentation/home_page.dart';

enum MtpRoute {
  login,
  home,
  chores,
  tables,
  settings,
}

final List<MtpRoute> appPages = [
  MtpRoute.home,
  MtpRoute.chores,
  MtpRoute.tables,
  MtpRoute.settings,
];

extension MtpRouteExt on MtpRoute {
  IconData getIcon() {
    switch (this) {
      case MtpRoute.login:
        return Icons.login;
      case MtpRoute.home:
        return Icons.home;
      case MtpRoute.chores:
        return Icons.local_laundry_service;
      case MtpRoute.tables:
        return Icons.table_chart;
      case MtpRoute.settings:
        return Icons.settings;
    }
  }
  
  Color? getColor(MtpColors? colors) {
    if (colors == null) return null;
    switch (this){
      case MtpRoute.chores: return colors.secondary;
      case MtpRoute.tables: return colors.tertiary;
      default: return colors.primary;
    }
  }


  MtpFragment getPage() {
    switch (this) {
      case MtpRoute.login:
        return const LoginPage();
      case MtpRoute.home:
        return const HomePage();
      case MtpRoute.chores:
        break;
      case MtpRoute.tables:
        break;
      case MtpRoute.settings:
        break;
    }
    return const UnknownRoutePage();
  }
}
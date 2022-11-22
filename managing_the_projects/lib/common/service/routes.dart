import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/model/theme_model.dart';
import 'package:managing_the_projects/common/presentation/unknown_route_frag.dart';

enum MtpRoute {
  login,
  signup,
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
  static MtpRoute? fromString(String value) {
    try {
      return MtpRoute.values.firstWhere((element) => element.name == value);
    } catch (e) {
      return null;
    }
  }

  IconData getIcon() {
    switch (this) {
      case MtpRoute.login:
        return Icons.login;
      case MtpRoute.signup:
        return Icons.person_add;
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
    switch (this) {
      case MtpRoute.chores:
        return colors.secondary;
      case MtpRoute.tables:
        return colors.tertiary;
      default:
        return colors.primary;
    }
  }

  Color? getOtherColor(MtpColors? colors) {
    if (colors == null) return null;
    switch (this) {
      case MtpRoute.chores:
        return colors.onSecondary;
      case MtpRoute.tables:
        return colors.onTertiary;
      default:
        return colors.onPrimary;
    }
  }

  Widget getPresentation() {
    switch (this) {
      case MtpRoute.login:
        break;
      case MtpRoute.signup:
        break;
      case MtpRoute.home:
        break;
      case MtpRoute.chores:
        break;
      case MtpRoute.tables:
        break;
      case MtpRoute.settings:
        break;
    }
    return UnknownRouteFrag();
  }
}

Route? onGenerateRoute(RouteSettings settings) {
  return null;
}
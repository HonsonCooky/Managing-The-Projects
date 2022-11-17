import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/model/theme_model.dart';

mixin MtpAliases {
  MtpColors mtpColors(BuildContext context) => Theme.of(context).extension<MtpColors>()!;
  Orientation orientation(BuildContext context) => MediaQuery.of(context).orientation;
  bool isPortrait(BuildContext context) => orientation(context) == Orientation.portrait;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;
}
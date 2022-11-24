import 'package:flutter_neumorphic/flutter_neumorphic.dart';

mixin MtpAliases {
  NeumorphicThemeData mtpTheme(BuildContext context) => NeumorphicTheme.currentTheme(context);

  Orientation orientation(BuildContext context) => MediaQuery.of(context).orientation;

  bool isPortrait(BuildContext context) => orientation(context) == Orientation.portrait;

  double width(BuildContext context) => MediaQuery.of(context).size.width;

  double height(BuildContext context) => MediaQuery.of(context).size.height;

  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

  double largeIndent(BuildContext context) => (isPortrait(context) ? width(context) : height(context)) / 10;
  
  double mediumIndent(BuildContext context) => (isPortrait(context) ? width(context) : height(context)) / 15;

  double smallIndent(BuildContext context) => (isPortrait(context) ? width(context) : height(context)) / 20;

  double largeGap(BuildContext context) => (isPortrait(context) ? height(context) : width(context)) / 10;

  double mediumGap(BuildContext context) => (isPortrait(context) ? height(context) : width(context)) / 20;

  double smallGap(BuildContext context) => (isPortrait(context) ? height(context) : width(context)) / 40;

  static const double borderRadiusSize = 20;
}

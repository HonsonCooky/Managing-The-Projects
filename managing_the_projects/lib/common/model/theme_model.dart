import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

/// --------------------------------------------------------------------------------------------------------------------
/// LIGHT THEME
/// --------------------------------------------------------------------------------------------------------------------

const lightNeuTheme = NeumorphicThemeData(
  baseColor: Color(0xffe1d9cf),
  accentColor: Color(0xffD64065),
  variantColor: Color(0xff40C4D6),
  borderColor: Color(0xff7A53ED),
  shadowLightColor: Color(0xfffaf9f7),
  shadowDarkColor: Color(0xff3c3225),
  defaultTextColor: Color(0xff231d15),
);

/// --------------------------------------------------------------------------------------------------------------------
/// DARK THEME
/// --------------------------------------------------------------------------------------------------------------------

const darkNeuTheme = NeumorphicThemeData(
);

import 'package:flutter/material.dart';

@immutable
class MtpColors extends ThemeExtension<MtpColors> {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color tertiary;
  final Color onTertiary;
  final Color background;
  final Color onBackground;

  const MtpColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.tertiary,
    required this.onTertiary,
    required this.background,
    required this.onBackground,
  });

  @override
  MtpColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? tertiary,
    Color? onTertiary,
    Color? background,
    Color? onBackground,
  }) {
    return MtpColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
    );
  }

  @override
  MtpColors lerp(ThemeExtension<MtpColors>? other, double t) {
    if (other is! MtpColors) {
      return this;
    }
    return MtpColors(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t) ?? onPrimary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t) ?? onSecondary,
      tertiary: Color.lerp(tertiary, other.tertiary, t) ?? tertiary,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t) ?? onTertiary,
      background: Color.lerp(background, other.background, t) ?? background,
      onBackground: Color.lerp(onBackground, other.onBackground, t) ?? onBackground,
    );
  }

  // Optional
  @override
  String toString() => 'MtpColors('
      'Primary: $primary, '
      'OnPrimary: $onPrimary'
      'Secondary: $secondary, '
      'OnSecondary: $onSecondary'
      'Tertiary: $tertiary, '
      'OnTertiary: $onTertiary'
      'Background: $background, '
      'OnBackground: $onBackground';
}

class ColorSchemes {
  final mtpLightTheme = const MtpColors(
    primary: Color(0xff8bbaf0),
    onPrimary: Color(0Xff004a78),
    secondary: Color(0xfff8cdde),
    onSecondary: Color(0xff96707f),
    tertiary: Color(0xfffbedc9),
    onTertiary: Color(0xff948868),
    background: Color(0xfffaf8f6),
    onBackground: Color(0xff565758),
  );

  final mtpDarkTheme = const MtpColors(
    primary: Color(0xff8be9fd),
    onPrimary: Color(0xff004a5c),
    secondary: Color(0xffff79c6),
    onSecondary: Color(0xff790050),
    tertiary: Color(0xfff1fa8c),
    onTertiary: Color(0xff667400),
    background: Color(0xff282a36),
    onBackground: Color(0xffb3b5c5),
  );
}
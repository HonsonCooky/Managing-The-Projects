import 'package:flutter/material.dart';

/// --------------------------------------------------------------------------------------------------------------------
/// BASE THEME
/// --------------------------------------------------------------------------------------------------------------------

@immutable
class MtpColors extends ThemeExtension<MtpColors> {
  final Color? primary;
  final Color? secondary;
  final Color? tertiary;
  final Color? background;
  final Color? shade;
  final Color? text;
  final Color? label;

  const MtpColors({
    this.primary,
    this.secondary,
    this.tertiary,
    this.background,
    this.shade,
    this.text,
    this.label,
  });

  @override
  MtpColors copyWith({Color? primary, Color? secondary, Color? tertiary, Color? background, Color? shade}) {
    return MtpColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      background: background ?? this.background,
      shade: shade ?? this.shade,
    );
  }

  @override
  MtpColors lerp(ThemeExtension<MtpColors>? other, double t) {
    if (other is! MtpColors) {
      return this;
    }
    return MtpColors(
      primary: Color.lerp(primary, other.primary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      tertiary: Color.lerp(tertiary, other.tertiary, t),
      background: Color.lerp(background, other.background, t),
      shade: Color.lerp(shade, other.shade, t),
    );
  }

  // Optional
  @override
  String toString() => 'MtpColors('
      'Primary: $primary, '
      'Secondary: $secondary, '
      'Tertiary: $tertiary, '
      'Background: $background, '
      'Shade: $shade)';
}

final baseTheme = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 5,
  ),
);

/// --------------------------------------------------------------------------------------------------------------------
/// LIGHT THEME
/// --------------------------------------------------------------------------------------------------------------------
final lightTheme = baseTheme.copyWith(
  brightness: Brightness.light,
  extensions: <MtpColors>[
    const MtpColors(
      primary: Color(0xff8bbaf0),
      secondary: Color(0xfff8cdde),
      tertiary: Color(0xfffbedc9),
      background: Color(0xfffbfcfe),
      shade: Color(0xffd7dce9),
      text: Color(0xff909193),
      label: Color(0Xff727375),
    ),
  ],
);

/// --------------------------------------------------------------------------------------------------------------------
/// DARK THEME
/// --------------------------------------------------------------------------------------------------------------------
final darkTheme = baseTheme.copyWith(brightness: Brightness.dark, extensions: <MtpColors>[
  const MtpColors(
    primary: Color(0xff8be9fd),
    secondary: Color(0xffff79c6),
    tertiary: Color(0xfff1fa8c),
    background: Color(0xff282a36),
    shade: Color(0xfff8f8f2),
    text: Color(0xff717381),
    label: Color(0Xff8f91a0),
  ),
]);

import 'package:flutter/material.dart';

/// --------------------------------------------------------------------------------------------------------------------
/// BASE THEME
/// --------------------------------------------------------------------------------------------------------------------

@immutable
class MtpColors extends ThemeExtension<MtpColors> {
  final Color? primary;
  final Color? onPrimary;
  final Color? secondary;
  final Color? onSecondary;
  final Color? tertiary;
  final Color? onTertiary;
  final Color? background;
  final Color? onBackground;
  final Color? shade;

  const MtpColors({
    this.primary,
    this.onPrimary,
    this.secondary,
    this.onSecondary,
    this.tertiary,
    this.onTertiary,
    this.background,
    this.shade,
    this.onBackground,
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
      onPrimary: Color(0Xff004a78),
      secondary: Color(0xfff8cdde),
      onSecondary: Color(0xff96707f),
      tertiary: Color(0xfffbedc9),
      onTertiary: Color(0xff948868),
      background: Color(0xfffbfcfe),
      onBackground: Color(0xff909193),
      shade: Color(0xffd7dce9),
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
    onBackground: Color(0xff717381),
  ),
]);

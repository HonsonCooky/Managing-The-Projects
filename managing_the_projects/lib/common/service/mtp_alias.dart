import 'package:flutter/foundation.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/user/services/current_user.dart';

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

  bool keyboardOpen() => WidgetsBinding.instance.window.viewInsets.bottom > 0.0;

  bool verificationRequired(CurrentUserManager userManager) =>
      userManager.currentUser != null && !userManager.currentUser!.emailVerified;

  bool verified(CurrentUserManager userManager) =>
      userManager.currentUser != null && userManager.currentUser!.emailVerified;

  bool authenticated(CurrentUserManager userManager) => verified(userManager) && userManager.cachedUserModel != null;

  void _mtpSnack(BuildContext context, String msg, Color color, Color textColor) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(milliseconds: 4000),
        behavior: SnackBarBehavior.floating,
        elevation: 6,
        content: Text(
          msg,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }

  void successSnack(BuildContext context, String msg) {
    _mtpSnack(context, msg, mtpTheme(context).baseColor, mtpTheme(context).defaultTextColor);
  }

  String _errorTranslation(String errorMsg) {
    return errorMsg
        .replaceAll("[firebase_auth/unknown] Given String is empty or null", "Missing credentials")
        .replaceAll("[firebase_auth/invalid-email]", "")
        .replaceAll("Exception: ", "");
  }

  void errorSnack(BuildContext context, String msg) {
    if (kDebugMode) print(msg);
    msg = _errorTranslation(msg);
    _mtpSnack(context, msg, mtpTheme(context).accentColor, mtpTheme(context).baseColor);
  }

  static const double borderRadiusSize = 20;

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
}

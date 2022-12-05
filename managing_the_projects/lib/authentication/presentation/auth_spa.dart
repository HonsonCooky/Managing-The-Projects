import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/authentication/presentation/forgot_password_page.dart';
import 'package:managing_the_projects/authentication/presentation/login_page.dart';
import 'package:managing_the_projects/authentication/presentation/signup_page.dart';
import 'package:managing_the_projects/common/presentation/mtp_dismissable.dart';
import 'package:managing_the_projects/common/presentation/mtp_logo.dart';
import 'package:managing_the_projects/common/presentation/mtp_overlay.dart';
import 'package:managing_the_projects/common/presentation/mtp_page_indicator.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class AuthSpa extends StatefulWidget {
  const AuthSpa({super.key});

  @override
  State<StatefulWidget> createState() => _AuthSpaState();
}

class _AuthSpaState extends State<AuthSpa> with SingleTickerProviderStateMixin, MtpAliases {
  final PageController _pageController = PageController(initialPage: 1);

  void _changePage(int index) => _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );

  late final List<Widget> _pages = [
    ForgotPasswordPage(changePage: _changePage),
    LoginPage(changePage: _changePage),
    SignupPage(changePage: _changePage),
  ];

  Widget _logo() {
    return Container(
      width: width(context) / (isPortrait(context) ? 1 : 3),
      padding: EdgeInsets.only(top: height(context) / 20),
      child: const MtpLogo(),
    );
  }

  Widget _pageBody() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: _pages,
        ),
        MtpPageIndicator(
          controller: _pageController,
          numberOfPages: _pages.length,
          changePage: _changePage,
        ),
      ],
    );
  }

  Widget _portraitMode() {
    return Column(
      children: [
        _logo(),
        Expanded(child: _pageBody()),
      ],
    );
  }

  Widget _landscapeMode() {
    return Row(
      children: [
        _logo(),
        Expanded(child: _pageBody()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MtpOverlay(
      child: MtpDismiss(
        child: Scaffold(
          body: isPortrait(context) ? _portraitMode() : _landscapeMode(),
        ),
      ),
    );
  }
}

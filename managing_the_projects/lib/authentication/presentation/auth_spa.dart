import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/authentication/presentation/login_page.dart';
import 'package:managing_the_projects/authentication/presentation/signup_page.dart';
import 'package:managing_the_projects/common/presentation/mtp_dismissable.dart';
import 'package:managing_the_projects/common/presentation/mtp_overlay.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class AuthSpa extends StatefulWidget {
  const AuthSpa({super.key});

  @override
  State<StatefulWidget> createState() => _AuthSpaState();
}

class _AuthSpaState extends State<AuthSpa> with SingleTickerProviderStateMixin, MtpAliases {
  final PageController _pageController = PageController();

  void _changePage(int index) =>
      _pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);

  late final List<Widget> _pages = [
    LoginPage(changePage: _changePage),
    SignupPage(changePage: _changePage),
  ];

  PreferredSizeWidget _logo() {
    return PreferredSize(
      preferredSize: Size(width(context), height(context) / 4),
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MtpOverlay(
      child: MtpDismiss(
        child: Scaffold(
          appBar: _logo(),
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: _pages.length,
                  itemBuilder: (_, index) => _pages[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/common/presentation/mtp_dismissable.dart';
import 'package:managing_the_projects/common/presentation/mtp_overlay.dart';
import 'package:managing_the_projects/common/presentation/mtp_page_indicator.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class HomeSpa extends StatefulWidget {
  const HomeSpa({super.key});

  @override
  State<StatefulWidget> createState() => _HomeSpaState();
}

class _HomeSpaState extends State<HomeSpa> with MtpAliases {
  final _pageController = PageController();
  final _pages = [];

  void _changePage(int index) => _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );

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

  Widget _portraitMode() {
    return ListView(
      children: [
        MtpPageIndicator(
          controller: _pageController,
          numberOfPages: _pages.length,
          changePage: _changePage,
        ),
      ],
    );
  }

  Widget _landscapeMode() {
    return Row(
      children: [],
    );
  }
}

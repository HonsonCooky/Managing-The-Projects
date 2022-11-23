import 'package:flutter/material.dart';
import 'package:managing_the_projects/authentication/presentation/login_page.dart';
import 'package:managing_the_projects/common/presentation/components/mtp_overlay.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class AuthSpa extends StatefulWidget {
  const AuthSpa({super.key});

  @override
  State<StatefulWidget> createState() => _AuthSpaState();
}

class _AuthSpaState extends State<AuthSpa> with SingleTickerProviderStateMixin, MtpAliases {
  /// Current Page index
  int _index = 0;

  /// Potential Pages
  late final List<Widget> _offStagePages = [
    LoginPage(index: 0, currentIndex: _index),
  ];

  /// Sliding Animation
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  Widget _transition() {
    return SlideTransition(
      position: _offsetAnimation,
      child: _offStagePages[_index],
    );
  }

  void _setPageIndex(int index) {
    setState(() => _index = index);
  }

  @override
  Widget build(BuildContext context) {
    return MtpOverlay(
      child: Scaffold(
        backgroundColor: mtpColors(context).background,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: _offStagePages[_index],
        ),
      ),
    );
  }
}

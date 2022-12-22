import 'package:flutter/material.dart';

class MtpDismiss extends StatelessWidget {
  final Widget child;

  const MtpDismiss({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}

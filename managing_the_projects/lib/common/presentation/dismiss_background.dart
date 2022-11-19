import 'package:flutter/cupertino.dart';

class DismissBackground extends StatelessWidget {
  final Widget child;

  const DismissBackground({super.key, required this.child});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
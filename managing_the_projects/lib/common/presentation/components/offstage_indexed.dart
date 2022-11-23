import 'package:flutter/cupertino.dart';

class OffStageIndexed extends StatelessWidget {
  final Widget child;
  final int index;
  final int currentIndex;

  const OffStageIndexed({super.key, required this.child, required this.index, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: index != currentIndex,
      child: child,
    );
  }
  
}
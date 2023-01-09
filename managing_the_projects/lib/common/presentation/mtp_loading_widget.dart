import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MtpLoadingWidget extends StatelessWidget {
  final bool show;
  final Widget other;

  const MtpLoadingWidget({super.key, required this.show, required this.other});

  @override
  Widget build(BuildContext context) {
    if (!show) return other;
    return const SizedBox(
      height: 12,
      child: NeumorphicProgressIndeterminate(),
    );
  }
}

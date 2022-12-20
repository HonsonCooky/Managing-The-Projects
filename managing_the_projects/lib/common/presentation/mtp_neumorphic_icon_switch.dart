import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpNeumorphicIconSwitch extends StatelessWidget with MtpAliases {
  final IconData iconData;
  final Future<void> Function() onTap;
  final Color? textColor;

  const MtpNeumorphicIconSwitch(this.iconData, {super.key, required this.onTap, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: NeumorphicIcon(
        iconData,
        style: NeumorphicStyle(depth: 1, color: textColor),
        size: textTheme(context).titleLarge!.fontSize!,
      ),
    );
  }
}

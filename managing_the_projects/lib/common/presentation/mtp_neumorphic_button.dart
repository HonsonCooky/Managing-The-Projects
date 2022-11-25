import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpNeumorphicButton extends StatelessWidget with MtpAliases {
  final String text;
  final Widget? icon;
  final void Function() onPressed;

  const MtpNeumorphicButton({super.key, required this.text, this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: const NeumorphicStyle(
        depth: 3,
        boxShape: NeumorphicBoxShape.stadium(),
      ),
      onPressed: onPressed,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: width(context) / 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: textTheme(context).titleLarge?.copyWith(
                  color: mtpTheme(context).defaultTextColor,
                ),
              ),
              icon ?? const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

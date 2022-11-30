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
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      style: const NeumorphicStyle(
        depth: 3,
        boxShape: NeumorphicBoxShape.stadium(),
        intensity: 0.5,
      ),
      onPressed: onPressed,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: width(context) / 3,
            maxHeight: textTheme(context).titleMedium!.fontSize! * 1.5,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: textTheme(context).titleMedium?.copyWith(
                      color: mtpTheme(context).defaultTextColor,
                    ),
              ),
              const SizedBox(width: 10),
              icon ?? const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

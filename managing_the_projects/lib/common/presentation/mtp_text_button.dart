import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpTextButton extends StatefulWidget {
  final String text;
  final void Function() onPressed;

  const MtpTextButton({super.key, required this.text, required this.onPressed});

  @override
  State<StatefulWidget> createState() => _MtpTextButtonState();
}

class _MtpTextButtonState extends State<MtpTextButton> with MtpAliases {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      child: TextButton(
        style: ButtonStyle(
          animationDuration: Neumorphic.DEFAULT_DURATION,
          shape: MaterialStateProperty.resolveWith((states) => const StadiumBorder()),
          padding: MaterialStateProperty.resolveWith(
            (states) => EdgeInsets.symmetric(
              horizontal: width(context) / 20,
              vertical: 0,
            ),
          ),
          overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) => _pressed ? mtpTheme(context).accentColor : mtpTheme(context).defaultTextColor,
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: const TextStyle(decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}

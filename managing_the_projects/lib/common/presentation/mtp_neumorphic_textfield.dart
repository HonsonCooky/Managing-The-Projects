import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpNeumorphicTextfield extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool canObscure;

  const MtpNeumorphicTextfield({super.key, required this.label, required this.controller, this.canObscure = false});

  @override
  State<StatefulWidget> createState() => _MtpNeumorphicTextfieldState();
}

class _MtpNeumorphicTextfieldState extends State<MtpNeumorphicTextfield>
    with MtpAliases, SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: const NeumorphicStyle(depth: -3, boxShape: NeumorphicBoxShape.stadium(), intensity: 1),
      child: TextField(
        obscureText: widget.canObscure,
        controller: widget.controller,
        style: textTheme(context).titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: mtpTheme(context).defaultTextColor,
            ),
        cursorColor: mtpTheme(context).accentColor,
        decoration: InputDecoration(
          hintText: widget.label,
          hintStyle: textTheme(context).titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: mtpTheme(context).defaultTextColor.withAlpha(120),
              ),
          filled: true,
          fillColor: lighten(mtpTheme(context).baseColor).withAlpha(20),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: width(context) / 20,
            vertical: textTheme(context).titleMedium!.fontSize! / 1.5,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}

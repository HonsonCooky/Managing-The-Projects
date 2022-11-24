import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpNeumorphicTextfield extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool? isObscure;

  const MtpNeumorphicTextfield({super.key, required this.label, required this.controller, this.isObscure});

  @override
  State<StatefulWidget> createState() => _MtpNeumorphicTextfieldState();
}

class _MtpNeumorphicTextfieldState extends State<MtpNeumorphicTextfield>
    with MtpAliases, SingleTickerProviderStateMixin {
  late final FocusNode _focus;
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _animation = AnimationController(
      vsync: this,
      duration: Neumorphic.DEFAULT_DURATION,
      reverseDuration: Neumorphic.DEFAULT_DURATION,
      lowerBound: -3,
      upperBound: 0,
    );
    _animation.addListener(() => setState(() {}));
    _focus.addListener(() {
      if (_focus.hasFocus) {
        _animation.forward();
      } else {
        _animation.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(depth: _animation.value, intensity: 0.9, boxShape: const NeumorphicBoxShape.stadium()),
      child: TextField(
        focusNode: _focus,
        controller: widget.controller,
        style: textTheme(context).titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: mtpTheme(context).borderColor,
            ),
        decoration: InputDecoration(
          hintText: widget.label,
          hintStyle: textTheme(context).titleLarge?.copyWith(
                color: mtpTheme(context).borderColor.withAlpha((255 - ((_animation.value + 3) * 30)).toInt()),
              ),
          floatingLabelStyle: TextStyle(color: mtpTheme(context).borderColor),
          contentPadding: EdgeInsets.symmetric(horizontal: width(context) / 20),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class UserInput extends StatelessWidget with MtpAliases {
  final BuildContext context;
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final FocusNode focusNode;

  late final TextStyle? hintStyle = textTheme(context).titleLarge?.copyWith(
        color: mtpColors(context).onBackground,
        fontWeight: FontWeight.w200,
      );
  late final TextStyle? textStyle = hintStyle?.copyWith(
    color: mtpColors(context).onBackground,
  );
  late final TextStyle? hintFocusStyle = hintStyle?.copyWith(
    color: mtpColors(context).onBackground?.withAlpha(100),
  );

  UserInput(
    this.context, {
    super.key,
    required this.hint,
    required this.controller,
    required this.obscureText,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        style: textStyle,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          hintStyle: focusNode.hasFocus ? hintFocusStyle : hintStyle,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: mtpColors(context).onBackground!,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: mtpColors(context).onBackground!.withAlpha(100),
            ),
          ),
        ),
      ),
    );
  }
}

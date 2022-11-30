import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpBottomSheetSelection extends StatelessWidget with MtpAliases {
  final String text;
  final IconData? leadingIcon;
  final Color? textColor;
  final Color? splashColor;
  final void Function()? onTap;

  const MtpBottomSheetSelection({
    super.key,
    required this.text,
    this.textColor,
    this.onTap,
    this.leadingIcon,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor ?? mtpTheme(context).accentColor,
        child: Container(
          margin: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(
                leadingIcon,
                color: textColor ?? mtpTheme(context).defaultTextColor,
                size: textTheme(context).bodyLarge!.fontSize! * 1.5,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: textTheme(context).bodyLarge?.copyWith(color: textColor ?? mtpTheme(context).defaultTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

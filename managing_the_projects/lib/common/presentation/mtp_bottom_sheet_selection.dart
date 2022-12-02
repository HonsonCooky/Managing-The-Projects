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
          margin: EdgeInsets.all(textTheme(context).bodyLarge!.fontSize!),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                leadingIcon,
                color: textColor ?? mtpTheme(context).defaultTextColor,
                size: textTheme(context).bodyLarge!.fontSize! * 1.5,
              ),
              SizedBox(width: textTheme(context).bodyLarge!.fontSize),
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

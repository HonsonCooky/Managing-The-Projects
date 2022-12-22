import 'package:flutter/material.dart';
import 'package:managing_the_projects/authentication/data/auth_manager.dart';
import 'package:managing_the_projects/authentication/services/attempt_signups.dart';
import 'package:managing_the_projects/common/presentation/mtp_neumorphic_button.dart';
import 'package:managing_the_projects/common/presentation/mtp_text_button.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';
import 'package:managing_the_projects/user/services/current_user.dart';

class VerificationPage extends StatefulWidget {
  final void Function(int index) changePage;

  const VerificationPage({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() => _VerificationState();
}

class _VerificationState extends State<VerificationPage> with MtpAliases {
  var _refreshing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(context) / 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Verification",
            style: textTheme(context).displayMedium?.copyWith(
                  fontWeight: FontWeight.w200,
                  color: mtpTheme(context).defaultTextColor,
                ),
          ),
          const SizedBox(height: 10,),
          Text(
            "- Check your emails (including spam).\n\n"
            "- Follow the instructions in email.\n\n"
            "- Hit the refresh button below once complete.\n"
            "     - Hit the refresh button below to resend email.\n\n",
            style: textTheme(context).bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          const Expanded(child: SizedBox()),
          const SizedBox(height: 40),
          MtpNeumorphicButton(
            text: "REFRESH",
            icon: Icon(
              Icons.refresh,
              size: textTheme(context).titleMedium?.fontSize,
              color: mtpTheme(context).defaultTextColor,
            ),
            onPressed: () async {
              try {
                setState(() => _refreshing = true);
                await AuthManager.instance.verify();
              } finally {
                setState(() => _refreshing = false);
              }
            },
          ),
          MtpTextButton(
            text: "Go Back",
            onPressed: () async {
              await undo("Failed Verification", CurrentUserManager.instance.cachedUserModel);
              setState(() {});
              widget.changePage(2);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

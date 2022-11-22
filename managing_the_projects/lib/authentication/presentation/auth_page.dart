import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:managing_the_projects/authentication/presentation/login_frag.dart';
import 'package:managing_the_projects/common/presentation/dismiss_background.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with MtpAliases {
  Widget _title() {
    return SafeArea(
      child: Container(
        height: height(context) / 3,
        decoration: BoxDecoration(
          color: mtpColors(context).primary,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(borderRadiusSize)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: smallIndent(context)),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "BARELY\nMANAGING",
              style: textTheme(context).displayMedium?.copyWith(color: mtpColors(context).onPrimary),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: mtpColors(context).onPrimary),
      child: DismissBackground(
        child: Scaffold(
          backgroundColor: mtpColors(context).background,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _title(),
              const Flexible(
                child: LoginFrag(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

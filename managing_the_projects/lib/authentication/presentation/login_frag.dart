import 'package:flutter/material.dart';
import 'package:managing_the_projects/authentication/presentation/user_input.dart';
import 'package:managing_the_projects/common/presentation/mtp_fragment.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class LoginFrag extends MtpFragmentStateful {
  const LoginFrag({super.key});

  @override
  State<StatefulWidget> createState() => _LoginFragState();
}

class _LoginFragState extends State<LoginFrag> with MtpAliases {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _usernameFN = FocusNode();
  final _passwordFN = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameFN.addListener(() => setState(() {}));
    _passwordFN.addListener(() => setState(() {}));
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: largeGap(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: largeIndent(context)),
          child: Text(
            "LOGIN",
            style: textTheme(context).headlineLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: mtpColors(context).onBackground,
                ),
          ),
        ),
        SizedBox(height: height(context) / 40),
        // USERNAME
        UserInput(context, controller: _username, hint: "Username", focusNode: _usernameFN, obscureText: false),
        // PASSWORD
        UserInput(context, controller: _password, hint: "Password", focusNode: _passwordFN, obscureText: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: mediumIndent(context)),
      child: _body(),
    );
  }
}

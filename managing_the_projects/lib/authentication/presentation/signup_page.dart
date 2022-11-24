import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class SignupPage extends StatefulWidget {
  final void Function(int index) changePage;
  const SignupPage({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with MtpAliases {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "SIGNUP",
          style: textTheme(context).headlineLarge,
        ),
        ElevatedButton(
          onPressed: () => widget.changePage(0),
          child: const Text("PAGE 2"),
        )
      ],
    );
  }
}

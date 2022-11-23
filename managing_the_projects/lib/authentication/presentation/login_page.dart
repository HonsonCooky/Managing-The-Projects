import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/presentation/components/offstage_indexed.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class LoginPage extends StatefulWidget {
  final int index;
  final int currentIndex;
  const LoginPage({super.key, required this.index, required this.currentIndex});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MtpAliases {
  final _username = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return OffStageIndexed(
      index: widget.index,
      currentIndex: widget.currentIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("LOGIN", style: textTheme(context).headlineLarge?.copyWith(color: Colors.black),)
        ],
      ),
    );
  }
}

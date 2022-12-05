import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/presentation/mtp_neumorphic_button.dart';
import 'package:managing_the_projects/common/presentation/mtp_neumorphic_textfield.dart';
import 'package:managing_the_projects/common/presentation/mtp_text_button.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class ForgotPasswordPage extends StatefulWidget {
  final void Function(int index) changePage;

  const ForgotPasswordPage({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> with MtpAliases {
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: height(context) / 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) / 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "FORGOT\nPASSWORD",
                style: textTheme(context).displayMedium?.copyWith(
                      fontWeight: FontWeight.w200,
                      color: mtpTheme(context).defaultTextColor,
                    ),
              ),
              SizedBox(height: height(context) / 40),
              MtpNeumorphicTextfield(label: "Email", controller: _email),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height(context) / 20),
                  MtpNeumorphicButton(
                    text: "SEND EMAIL",
                    icon: Icon(
                      Icons.person_add,
                      size: textTheme(context).titleMedium?.fontSize,
                      color: mtpTheme(context).defaultTextColor,
                    ),
                    onPressed: () {},
                  ),
                  MtpTextButton(
                    text: "Back",
                    onPressed: () => widget.changePage(1),
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

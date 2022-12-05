import 'dart:io';

import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/presentation/mtp_neumorphic_button.dart';
import 'package:managing_the_projects/common/presentation/mtp_neumorphic_textfield.dart';
import 'package:managing_the_projects/common/presentation/mtp_profile.dart';
import 'package:managing_the_projects/common/presentation/mtp_text_button.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class SignupPage extends StatefulWidget {
  final void Function(int index) changePage;

  const SignupPage({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with MtpAliases {
  final _email = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _password2 = TextEditingController();
  File? _currentImage;

  Future<void> _onImageUpdate(File imageUpdate) async {
    setState(() => _currentImage = imageUpdate);
  }

  Future<void> _onImageDelete() async {
    setState(() => _currentImage = null);
  }

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
                "SIGNUP",
                style: textTheme(context).displayMedium?.copyWith(
                      fontWeight: FontWeight.w200,
                      color: mtpTheme(context).defaultTextColor,
                    ),
              ),
              SizedBox(height: height(context) / 40),
              MtpProfile(
                currentImage: _currentImage,
                onImageUpdate: _onImageUpdate,
                onImageDelete: _onImageDelete,
                canAlter: true,
              ),
              SizedBox(height: height(context) / 80),
              MtpNeumorphicTextfield(label: "Email", controller: _email),
              SizedBox(height: height(context) / 80),
              MtpNeumorphicTextfield(label: "Username", controller: _username),
              SizedBox(height: height(context) / 80),
              MtpNeumorphicTextfield(label: "Password", controller: _password),
              SizedBox(height: height(context) / 80),
              MtpNeumorphicTextfield(label: "Confirm Password", controller: _password2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height(context) / 20),
                  MtpNeumorphicButton(
                    text: "SIGNUP",
                    icon: Icon(
                      Icons.person_add,
                      size: textTheme(context).titleMedium?.fontSize,
                      color: mtpTheme(context).defaultTextColor,
                    ),
                    onPressed: () {},
                  ),
                  MtpTextButton(
                    text: "Login",
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

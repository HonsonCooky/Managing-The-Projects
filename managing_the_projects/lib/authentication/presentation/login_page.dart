import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/common/presentation/mtp_neumorphic_button.dart';
import 'package:managing_the_projects/common/presentation/mtp_neumorphic_textfield.dart';
import 'package:managing_the_projects/common/presentation/mtp_text_button.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class LoginPage extends StatefulWidget {
  final void Function(int index) changePage;

  const LoginPage({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MtpAliases {
  final _email = TextEditingController();
  final _password = TextEditingController();

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
                "LOGIN",
                style: textTheme(context).displayMedium?.copyWith(
                      fontWeight: FontWeight.w200,
                      color: mtpTheme(context).defaultTextColor,
                    ),
              ),
              SizedBox(height: height(context) / 40),
              MtpNeumorphicTextfield(label: "Email", controller: _email),
              SizedBox(height: height(context) / 80),
              MtpNeumorphicTextfield(label: "Password", controller: _password),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: MtpTextButton(
                  text: "Forgot Password?",
                  onPressed: () => widget.changePage(0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height(context) / 20),
                  MtpNeumorphicButton(
                    text: "LOGIN",
                    icon: Icon(
                      Icons.login,
                      size: textTheme(context).titleMedium?.fontSize,
                      color: mtpTheme(context).defaultTextColor,
                    ),
                    onPressed: () {},
                  ),
                  MtpTextButton(
                    text: "Sign up",
                    onPressed: () => widget.changePage(2),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

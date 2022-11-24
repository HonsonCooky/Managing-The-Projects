import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/common/presentation/mtp_neumorphic_button.dart';
import 'package:managing_the_projects/common/presentation/mtp_neumorphic_textfield.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class LoginPage extends StatefulWidget {
  final void Function(int index) changePage;

  const LoginPage({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MtpAliases {
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) / 20),
          child: Text(
            "LOGIN",
            style: textTheme(context)
                .displayMedium
                ?.copyWith(fontWeight: FontWeight.w200, color: mtpTheme(context).borderColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) / 20),
          child: Column(
            children: [
              MtpNeumorphicTextfield(label: "Username", controller: _username),
              const SizedBox(height: 8),
              MtpNeumorphicTextfield(label: "Password", controller: _password),
              const SizedBox(height: 16),
              MtpNeumorphicButton(
                text: "LOGIN",
                icon: Icon(Icons.login, color: mtpTheme(context).borderColor),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

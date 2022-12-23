import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/authentication/data/auth_manager.dart';
import 'package:managing_the_projects/common/presentation/mtp_loading_widget.dart';
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
  var _loading = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: height(context) / 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) / 15),
          child: _bodyComponents(),
        ),
      ],
    );
  }

  Widget _bodyComponents() {
    return Column(
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
        MtpLoadingWidget(show: _loading, other: _userInputs()),
      ],
    );
  }

  Widget _userInputs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MtpNeumorphicTextfield(label: "Email", controller: _email),
        SizedBox(height: height(context) / 80),
        MtpNeumorphicTextfield(label: "Password", controller: _password, canObscure: true),
        MtpTextButton(
          text: "Forgot Password?",
          onPressed: () => widget.changePage(0),
        ),
        SizedBox(height: height(context) / 40),
        _buttons(),
      ],
    );
  }

  Widget _buttons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: height(context) / 40),
        Row(
          children: [
            const Expanded(child: SizedBox()),
            MtpNeumorphicButton(
              text: "LOGIN",
              icon: Icon(
                Icons.login,
                size: textTheme(context).titleMedium?.fontSize,
                color: mtpTheme(context).defaultTextColor,
              ),
              onPressed: () async {
                try {
                  setState(() => _loading = true);
                  await AuthManager.instance.login(_email.text, _password.text);
                } catch (e) {
                  errorSnack(context, "$e");
                } finally {
                  setState(() => _loading = false);
                }
              },
            ),
            Expanded(
              child: NeumorphicButton(
                style: NeumorphicStyle(
                    depth: 3,
                    intensity: 0.6,
                    shape: NeumorphicShape.concave,
                    boxShape: const NeumorphicBoxShape.circle(),
                    color: mtpTheme(context).accentColor),
                child: Text(
                  "G+",
                  textAlign: TextAlign.center,
                  style: textTheme(context).titleLarge?.copyWith(color: mtpTheme(context).baseColor),
                ),
                onPressed: () async {
                  try {
                    setState(() => _loading = true);
                    await AuthManager.instance.signInWithGoogle();
                  } catch (e) {
                    errorSnack(context, "$e");
                  } finally {
                    setState(() => _loading = false);
                  }
                },
              ),
            ),
          ],
        ),
        MtpTextButton(
          text: "Signup",
          onPressed: () => widget.changePage(2),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managing_the_projects/authentication/services/attempt_signups.dart';
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
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _password2 = TextEditingController();
  XFile? _currentImage;
  var _loading = false;

  Future<void> _onImageUpdate(XFile imageUpdate) async {
    setState(() => _currentImage = imageUpdate);
  }

  Future<void> _onImageDelete() async {
    setState(() => _currentImage = null);
  }

  @override
  void dispose() {
    _email.dispose();
    _name.dispose();
    _password.dispose();
    _password2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _loadingWidget() {
    return const SizedBox(
      height: 12,
      child: NeumorphicProgressIndeterminate(),
    );
  }

  Widget _body() {
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
          "SIGNUP",
          style: textTheme(context).displayMedium?.copyWith(
                fontWeight: FontWeight.w200,
                color: mtpTheme(context).defaultTextColor,
              ),
        ),
        SizedBox(height: height(context) / 40),
        _loading ? _loadingWidget() : _userInputs(),
      ],
    );
  }

  Widget _userInputs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MtpProfile(
          currentImage: _currentImage,
          onImageUpdate: _onImageUpdate,
          onImageDelete: _onImageDelete,
          canAlter: true,
        ),
        SizedBox(height: height(context) / 80),
        MtpNeumorphicTextfield(label: "Email", controller: _email),
        SizedBox(height: height(context) / 80),
        MtpNeumorphicTextfield(label: "Username", controller: _name),
        SizedBox(height: height(context) / 80),
        MtpNeumorphicTextfield(label: "Password", controller: _password, canObscure: true),
        SizedBox(height: height(context) / 80),
        MtpNeumorphicTextfield(label: "Confirm Password", controller: _password2, canObscure: true),
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
              text: "SIGNUP",
              icon: Icon(
                Icons.person_add,
                size: textTheme(context).titleMedium?.fontSize,
                color: mtpTheme(context).defaultTextColor,
              ),
              onPressed: () async {
                try {
                  setState(() => _loading = true);
                  await attemptSignup(
                    profileImage: _currentImage,
                    email: _email.text,
                    name: _name.text,
                    password: _password.text,
                    password2: _password2.text,
                  );
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
                    await attemptGoogleSignup();
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
          text: "Login",
          onPressed: () => widget.changePage(1),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

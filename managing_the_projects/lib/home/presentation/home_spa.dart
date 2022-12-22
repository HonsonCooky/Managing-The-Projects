import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/authentication/data/auth_manager.dart';
import 'package:managing_the_projects/common/presentation/mtp_dismissable.dart';
import 'package:managing_the_projects/common/presentation/mtp_overlay.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';
import 'package:managing_the_projects/user/model/user_model.dart';
import 'package:managing_the_projects/user/services/current_user.dart';
import 'package:provider/provider.dart';

class HomeSpa extends StatefulWidget {
  const HomeSpa({super.key});

  @override
  State<StatefulWidget> createState() => _HomeSpaState();
}

class _HomeSpaState extends State<HomeSpa> with MtpAliases {
  Widget _greeting(UserModel userModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeumorphicText(
        "Welcome ${userModel.name}",
        textAlign: TextAlign.left,
        textStyle: NeumorphicTextStyle(fontSize: textTheme(context).displayMedium?.fontSize),
        style: NeumorphicStyle(depth: 1, color: mtpTheme(context).variantColor),
      ),
    );
  }

  Widget _logout() {
    return NeumorphicButton(
      child: Text("Logout"),
      onPressed: () => AuthManager.instance.logout(),
    );
  }

  Widget _portraitMode(CurrentUserManager userManager) {
    return Column(
      children: [
        _greeting(userManager.cachedUserModel!),
        _logout(),
      ],
    );
  }

  Widget _landscapeMode(CurrentUserManager userManager) {
    return Row(
      children: [
        _greeting(userManager.cachedUserModel!),
        _logout(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserManager>(
      builder: (context, userManager, child) {
        return MtpOverlay(
          child: MtpDismiss(
            child: Scaffold(
              body: isPortrait(context) ? _portraitMode(userManager) : _landscapeMode(userManager),
            ),
          ),
        );
      },
    );
  }
}

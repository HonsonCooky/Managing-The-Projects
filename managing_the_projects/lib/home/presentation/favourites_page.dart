import 'package:flutter/cupertino.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';
import 'package:managing_the_projects/user/model/user_model.dart';
import 'package:managing_the_projects/user/services/current_user.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<StatefulWidget> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> with MtpAliases {
  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserManager>(builder: (context, userManager, child) {
      return Column(
        children: [
          _greeting(userManager.cachedUserModel!),
        ],
      );
    });
  }

  Widget _greeting(UserModel userModel) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        "Welcome ${userModel.name}",
        style: textTheme(context).displayMedium?.copyWith(
              fontWeight: FontWeight.w200,
              color: mtpTheme(context).defaultTextColor,
            ),
      ),
    );
  }
}

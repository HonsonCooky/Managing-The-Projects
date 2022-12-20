import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/authentication/presentation/auth_spa.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';
import 'package:managing_the_projects/home/presentation/home_spa.dart';
import 'package:managing_the_projects/user/services/current_user.dart';
import 'package:provider/provider.dart';

import 'common/model/theme_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(androidProvider: AndroidProvider.debug);
  FirebaseAuth.instance.userChanges().listen(CurrentUserManager.instance.firebaseAuthListener);
  runApp(const MtpApp());
}

class MtpApp extends StatelessWidget with MtpAliases {
  const MtpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentUserManager.instance),
      ],
      child: Consumer<CurrentUserManager>(
        builder: (context, userManager, child){
          return NeumorphicApp(
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            home: !authenticated(userManager) ? const AuthSpa() : const HomeSpa(),
            themeMode: userManager.cachedUserModel?.theme ?? ThemeMode.system,
            theme: lightNeuTheme,
            darkTheme: darkNeuTheme,
          );
        },
      ),
    );
  }
}

extension StringExt on String {
  String cap() => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String title() => split(" ").map((e) => e.cap()).join(" ");
}
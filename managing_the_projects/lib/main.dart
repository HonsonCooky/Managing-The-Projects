import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/authentication/presentation/auth_spa.dart';
import 'package:managing_the_projects/user/services/user_change_manager.dart';
import 'package:provider/provider.dart';

import 'common/model/theme_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MtpApp());
}

class MtpApp extends StatelessWidget {
  const MtpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentUserManager()),
      ],
      child: Consumer<CurrentUserManager>(
        builder: (context, userManager, child) => NeumorphicApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          home: userManager.currentUser == null ? const AuthSpa() : Container(color: Colors.pink,),
          themeMode: userManager.currentUser?.theme ?? ThemeMode.system,
          theme: lightNeuTheme,
          darkTheme: darkNeuTheme,
        ),
      ),
    );
  }
}

extension StringExt on String {
  String cap() => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String title() => split(" ").map((e) => e.cap()).join(" ");
}

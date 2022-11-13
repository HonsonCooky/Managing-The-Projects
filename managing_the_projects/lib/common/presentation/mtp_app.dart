import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/service/routes.dart';
import 'package:managing_the_projects/user/services/user_change_manager.dart';
import 'package:provider/provider.dart';

class MtpApp extends StatelessWidget {
  const MtpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserChangeManager()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        initialRoute: MtpRoute.home.name,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}

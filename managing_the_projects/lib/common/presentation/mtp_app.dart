import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/service/routes.dart';

class MtpApp extends StatelessWidget {
  const MtpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: MtpRoute.home.name,
      onGenerateRoute: onGenerateRoute,
    );
  }
  
}
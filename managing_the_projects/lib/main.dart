import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'common/presentation/mtp_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MtpApp());
}

extension StringExt on String {
  String cap() => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String title() => split(" ").map((e) => e.cap()).join(" ");
}

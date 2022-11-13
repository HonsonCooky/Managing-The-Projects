import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/presentation/mtp_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MtpScaffold(
      context,
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}

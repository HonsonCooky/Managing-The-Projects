import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpOverlay extends StatefulWidget {
  final Widget child;

  const MtpOverlay({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _MtpOverlayState();
}

class _MtpOverlayState extends State<MtpOverlay> with MtpAliases {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: mtpColors(context).onPrimary),
      child: SafeArea(child: widget.child),
    );
  }
}

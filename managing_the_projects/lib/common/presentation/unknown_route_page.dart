import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/presentation/mtp_fragment.dart';

class UnknownRoutePage extends MtpFragment {
  const UnknownRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Oh No! How'd we get here?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}

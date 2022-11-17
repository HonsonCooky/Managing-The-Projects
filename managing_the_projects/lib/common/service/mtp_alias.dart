import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/model/theme_model.dart';

mixin MtpAliases {
  MtpColors? mtpColors(BuildContext context) => Theme.of(context).extension<MtpColors>();
}
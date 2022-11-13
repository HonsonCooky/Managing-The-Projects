import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String uuid;
  String name;
  ThemeMode theme;
  bool onBoarded;

  UserModel({
    required this.uuid,
    required this.name,
    required this.theme,
    required this.onBoarded,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

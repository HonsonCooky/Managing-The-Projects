import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends JsonSerializable {
  String uuid;
  String name;
  ThemeMode theme;
  bool onBoarded;

  UserModel({
    required this.uuid,
    required this.name,
    this.theme = ThemeMode.system,
    this.onBoarded = false,
  });

  @override
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

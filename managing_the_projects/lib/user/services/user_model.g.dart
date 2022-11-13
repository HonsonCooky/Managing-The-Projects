// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      theme: $enumDecode(_$ThemeModeEnumMap, json['theme']),
      onBoarded: json['onBoarded'] as bool,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'theme': _$ThemeModeEnumMap[instance.theme]!,
      'onBoarded': instance.onBoarded,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

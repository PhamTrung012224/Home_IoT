// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_properties_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupPropertiesObject _$GroupPropertiesObjectFromJson(
        Map<String, dynamic> json) =>
    GroupPropertiesObject(
      feeds: (json['feeds'] as List<dynamic>?)
          ?.map((e) => Properties.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupPropertiesObjectToJson(
        GroupPropertiesObject instance) =>
    <String, dynamic>{
      'feeds': instance.feeds?.map((e) => e.toJson()).toList(),
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      last_value: json['last_value'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'last_value': instance.last_value,
      'key': instance.key,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceObject _$DeviceObjectFromJson(Map<String, dynamic> json) => DeviceObject(
      name: json['name'] as List<dynamic>,
      status: json['status'] as List<dynamic>,
      room: json['room'] as List<dynamic>,
      image: json['image'] as List<dynamic>,
      value: json['value'] as List<dynamic>,
      color: json['color'] as List<dynamic>?,
      speed: json['speed'] as List<dynamic>?,
    );

Map<String, dynamic> _$DeviceObjectToJson(DeviceObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'room': instance.room,
      'image': instance.image,
      'value': instance.value,
      'color': instance.color,
      'speed': instance.speed,
    };

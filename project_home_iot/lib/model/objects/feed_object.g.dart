// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedObject _$FeedObjectFromJson(Map<String, dynamic> json) => FeedObject(
      id: json['id'] as String,
      feed_id: json['feed_id'] as num,
      value: json['value'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      expiration: json['expiration'] as String,
    );

Map<String, dynamic> _$FeedObjectToJson(FeedObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feed_id': instance.feed_id,
      'value': instance.value,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'expiration': instance.expiration,
    };

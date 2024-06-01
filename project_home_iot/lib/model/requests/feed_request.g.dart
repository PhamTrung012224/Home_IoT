// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedRequest _$FeedRequestFromJson(Map<String, dynamic> json) => FeedRequest(
      value: json['value'] as String,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      ele: (json['ele'] as num?)?.toDouble(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$FeedRequestToJson(FeedRequest instance) =>
    <String, dynamic>{
      'value': instance.value,
      'lat': instance.lat,
      'lon': instance.lon,
      'ele': instance.ele,
      'created_at': instance.created_at?.toIso8601String(),
    };

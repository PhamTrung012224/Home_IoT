import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FeedObject {
  String id;
  num feed_id;
  String value;
  String created_at;
  String updated_at;
  String expiration;

  FeedObject(
      {required this.id,
      required this.feed_id,
      required this.value,
      required this.created_at,
      required this.updated_at,
      required this.expiration});

  factory FeedObject.fromJson(Map<String, dynamic> json) => FeedObject(
      id: json['id'],
      feed_id: json['feed_id'],
      value: json['value'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      expiration: json['expiration']);
}

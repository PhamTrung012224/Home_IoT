import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FeedObject {
  String id;
  // ignore: non_constant_identifier_names
  num feed_id;
  String value;
  // ignore: non_constant_identifier_names
  String created_at;
  // ignore: non_constant_identifier_names
  String updated_at;
  String expiration;

  FeedObject(
      {required this.id,
      // ignore: non_constant_identifier_names
      required this.feed_id,
      required this.value,
      // ignore: non_constant_identifier_names
      required this.created_at,
      // ignore: non_constant_identifier_names
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

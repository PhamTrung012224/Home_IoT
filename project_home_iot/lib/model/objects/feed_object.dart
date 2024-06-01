import 'package:json_annotation/json_annotation.dart';

part 'feed_object.g.dart';
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

  factory FeedObject.fromJson(Map<String, dynamic> json) => _$FeedObjectFromJson(json);
  Map<String,dynamic> toJson()=>_$FeedObjectToJson(this);
}

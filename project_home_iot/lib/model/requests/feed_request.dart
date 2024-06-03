// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'feed_request.g.dart';

@JsonSerializable()
class FeedRequest {
  String value;
  double? lat;
  double? lon;
  double? ele;
  DateTime? created_at;
  FeedRequest({required this.value,this.lat,this.lon,this.ele,this.created_at});

  factory FeedRequest.fromJson(Map<String, dynamic> json) => _$FeedRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FeedRequestToJson(this);
}

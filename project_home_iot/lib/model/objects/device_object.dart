import 'package:json_annotation/json_annotation.dart';

part 'device_object.g.dart';

@JsonSerializable()
class DeviceObject {
  List<dynamic> name;
  List<dynamic> status;
  List<dynamic> room;
  List<dynamic> image;
  List<dynamic> value;
  List<dynamic>? color;
  List<dynamic>? speed;
  DeviceObject(
      {required this.name,
      required this.status,
      required this.room,
      required this.image,
      required this.value,
      this.color,
      this.speed});
  factory DeviceObject.fromJson(Map<String, dynamic> json) =>
      _$DeviceObjectFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceObjectToJson(this);
}

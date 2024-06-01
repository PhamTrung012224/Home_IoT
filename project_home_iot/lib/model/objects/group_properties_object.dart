// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'group_properties_object.g.dart';

@JsonSerializable(explicitToJson: true)
class GroupPropertiesObject{
  List<Properties>? feeds;
  GroupPropertiesObject({required this.feeds});
  factory GroupPropertiesObject.fromJson(Map<String,dynamic>json)=>_$GroupPropertiesObjectFromJson(json);
  Map<String,dynamic> toJson()=>_$GroupPropertiesObjectToJson(this);
}



@JsonSerializable()
class Properties{
  String last_value;
  String key;
  Properties({required this.last_value,required this.key});
  factory Properties.fromJson(Map<String,dynamic> json)=>_$PropertiesFromJson(json);
  Map<String,dynamic> toJson()=>_$PropertiesToJson(this);
}

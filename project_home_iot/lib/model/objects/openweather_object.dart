import 'package:json_annotation/json_annotation.dart';

part 'openweather_object.g.dart';

@JsonSerializable()
class Coord {
  double lon;
  double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Weather {
  String main;
  String description;

  Weather({required this.main, required this.description});

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Main {
  double temp;
  double feels_like;
  int humidity;

  Main({required this.temp, required this.feels_like, required this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OpenWeatherObject {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  String name;
  // Add other fields as needed

  OpenWeatherObject({required this.coord, required this.weather, required this.base, required this.main, required this.name});

  factory OpenWeatherObject.fromJson(Map<String, dynamic> json) => _$OpenWeatherObjectFromJson(json);
  Map<String, dynamic> toJson() => _$OpenWeatherObjectToJson(this);
}
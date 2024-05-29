// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openweather_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      main: json['main'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
    };

Main _$MainFromJson(Map<String, dynamic> json) => Main(
      temp: (json['temp'] as num).toDouble(),
      feels_like: (json['feels_like'] as num).toDouble(),
      humidity: (json['humidity'] as num).toInt(),
    );

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'humidity': instance.humidity,
    };

OpenWeatherObject _$OpenWeatherObjectFromJson(Map<String, dynamic> json) =>
    OpenWeatherObject(
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String,
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$OpenWeatherObjectToJson(OpenWeatherObject instance) =>
    <String, dynamic>{
      'coord': instance.coord.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'base': instance.base,
      'main': instance.main.toJson(),
      'name': instance.name,
    };

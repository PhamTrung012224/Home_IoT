
import 'package:flutter/cupertino.dart';
import 'package:project_home_iot/model/objects/openweather_object.dart';
import 'package:project_home_iot/model/repositories/weather_repository.dart';
import 'package:project_home_iot/presenter/constants/weather_constants.dart';

final class WeatherPresenter extends ChangeNotifier{
  String lat;
  String lon;
  late WeatherRepository _weatherRepository;


  WeatherPresenter({required this.lat, required this.lon}){
    _weatherRepository=WeatherRepository(lat: lat, lon: lon, appid: WeatherConstants.appid);
  }

  OpenWeatherObject? currentWeather;

  void getLatestWeather() async {
    final response = await _weatherRepository.getWeatherInformation();
    currentWeather = response;
    notifyListeners();
  }

  void updateLocation(String lat, String lon) {
    this.lat=lat;
    this.lon=lon;
    _weatherRepository=WeatherRepository(lat: lat, lon: lon, appid: WeatherConstants.appid);
    getLatestWeather();
  }

}



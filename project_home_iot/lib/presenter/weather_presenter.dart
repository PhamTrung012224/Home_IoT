import 'package:flutter/cupertino.dart';
import 'package:project_home_iot/model/objects/openweather_object.dart';
import 'package:project_home_iot/model/repositories/weather_repository.dart';
import 'package:project_home_iot/presenter/constants/weather_constants.dart';

final class WeatherPresenter extends ChangeNotifier{
  final WeatherRepository _weatherRepository = WeatherRepository(lat: WeatherConstants.lat, lon: WeatherConstants.lon, appid: WeatherConstants.appid);

  OpenWeatherObject? currentWeather;

  void getLatestWeather() async {
    final response = await _weatherRepository.getWeatherInformation();
    currentWeather = response;
    notifyListeners();
  }

}



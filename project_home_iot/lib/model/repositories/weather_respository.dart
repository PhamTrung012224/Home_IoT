import 'package:project_home_iot/model/api_provider/http_provider.dart';
import 'package:project_home_iot/model/objects/openweather_object.dart';
import 'package:project_home_iot/model/constants/http_constants.dart';

final class WeatherRepository {
  final String lat;
  final String lon;
  final String appid;
  late HttpProvider httpProvider;

  WeatherRepository(
      {required this.lat, required this.lon, required this.appid}) {
    httpProvider = HttpProvider(
        baseUrl: HttpConstants.weatherBaseUrl,
        header: {},
        queryParameters: {"lat": lat, "lon": lon, "appid": appid});
  }

  Future<OpenWeatherObject?> getWeatherInformation() async {
    String path = "";
    final res = await httpProvider.get(path);
    if (res.isNotEmpty) {
      final weatherObject = OpenWeatherObject.fromJson(res);
      return weatherObject;
    }
    return null;
  }
}

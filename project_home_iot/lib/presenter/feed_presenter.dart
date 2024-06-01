import 'package:flutter/foundation.dart';
import 'package:project_home_iot/model/objects/feed_object.dart';
import 'package:project_home_iot/model/repositories/feed_repository.dart';
import 'package:project_home_iot/presenter/constants/adafruit_constants.dart';

final class FeedPresenter extends ChangeNotifier {
  final FeedRepository _feedRepository = FeedRepository();

  FeedObject? temperature;
  FeedObject? illuminance;
  FeedObject? humidity;

  void init() async {
    final res = await Future.wait([
      _feedRepository.getLastDataInQueue(
        AdafruitConstants.username,
        AdafruitConstants.temperatureSensorKey,
      ),
      _feedRepository.getLastDataInQueue(
          AdafruitConstants.username, AdafruitConstants.illuminanceSensorKey),
      _feedRepository.getLastDataInQueue(
          AdafruitConstants.username, AdafruitConstants.humiditySensorKey)
    ]);

    temperature = res.first;
    illuminance = res[1];
    humidity = res.last;

    notifyListeners();

  }

  void getLatestTemperature() async {
    final response = await _feedRepository.getLastDataInQueue(
      AdafruitConstants.username,
      AdafruitConstants.temperatureSensorKey,
    );
    temperature = response;
    notifyListeners();
  }

  void getLatestIlluminance() async {
    final response = await _feedRepository.getLastDataInQueue(
        AdafruitConstants.username, AdafruitConstants.illuminanceSensorKey);
    illuminance = response;
    notifyListeners();
  }

  void getLatestHumidity() async {
    final response = await _feedRepository.getLastDataInQueue(
        AdafruitConstants.username, AdafruitConstants.humiditySensorKey);
    humidity = response;
    notifyListeners();
  }

  void sendLatestData(String feedKey,String data) async {
    _feedRepository.postLatestData(AdafruitConstants.username, feedKey, data);
    notifyListeners();
  }
}

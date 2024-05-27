import 'package:flutter/foundation.dart';
import 'package:project_home_iot/model/objects/feed_object.dart';
import 'package:project_home_iot/model/repositories/feed_repository.dart';
import 'package:project_home_iot/presenter/constants/feed_constants.dart';

final class FeedPresenter extends ChangeNotifier {
  final FeedRepository _feedRepository = FeedRepository();

  FeedObject? temperature;

  void getLatestTemperature() async {
    final response = await _feedRepository.getLastDataInQueue(
      FeedConstants.username,
      FeedConstants.temperatureSensorName,
    );
    temperature = response;
    notifyListeners();
  }
}

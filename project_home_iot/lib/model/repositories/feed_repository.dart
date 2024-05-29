import 'package:project_home_iot/model/api_provider/http_provider.dart';
import 'package:project_home_iot/model/objects/feed_object.dart';
import 'package:project_home_iot/model/constants/http_constants.dart';

final class FeedRepository {
  HttpProvider httpProvider = HttpProvider(baseUrl: HttpConstants.adafruitBaseUrl, header: {'X-AIO-Key':HttpConstants.xAioKey});
  Future<FeedObject?> getLastDataInQueue(
      String username, String feedKey) async {
    final path = '/$username/feeds/$feedKey/data/last';

    final res = await httpProvider.get(path);
    if (res.isNotEmpty) {
      final feedObject = FeedObject.fromJson(res);
      return feedObject;
    }
    return null;
  }
}

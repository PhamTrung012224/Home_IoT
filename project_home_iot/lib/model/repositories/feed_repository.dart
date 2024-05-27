import 'package:project_home_iot/model/api_provider/http_provider.dart';
import 'package:project_home_iot/model/objects/feed_object.dart';

final class FeedRepository {

  Future<FeedObject?> getLastDataInQueue(
      String username, String feedKey) async {
    final path = '/$username/feeds/$feedKey/data/last';

    final res = await HttpProvider.get(path);
    if (res.isNotEmpty) {
      final feedObject = FeedObject.fromJson(res);
      return feedObject;
    }
    return null;
  }
}

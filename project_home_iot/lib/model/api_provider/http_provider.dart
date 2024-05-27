import 'package:dio/dio.dart';
import 'package:project_home_iot/model/constants/http_constants.dart';

final class HttpProvider {
  static final _dio =
      Dio(BaseOptions(baseUrl: 'http://io.adafruit.com/api/v2',
      headers: {
        'X-AIO-Key': HttpConstants.xAioKey
      }));

  static Future<Map<String, dynamic>> get(String path) async {
    try {
      final res = await _dio.get<Map<String, dynamic>>(path);
      if (res.statusCode != null &&
          (res.statusCode! >= 200 || res.statusCode! <= 299)) {
        return res.data ?? {};
      }
      return {};
    } catch (e) {
      rethrow;
    }
  }
}

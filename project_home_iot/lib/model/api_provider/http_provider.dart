import 'package:dio/dio.dart';

class HttpProvider {
  final String baseUrl;
  final Map<String, dynamic>? header;
  final Map<String, dynamic>? queryParameters;
  late final Dio _dio;

  HttpProvider({required this.baseUrl, this.header,this.queryParameters}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: header,
      queryParameters: queryParameters,
    ));
  }

  Future<Map<String, dynamic>> get(String path) async {
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

   Future<bool> post(String path, Map<String, dynamic> data) async {
    try {
        final res = await _dio.post<Map<String, dynamic>>(path,data: data );
      if (res.statusCode != null &&
          (res.statusCode! >= 200 || res.statusCode! <= 299)) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

}

import 'package:dio/dio.dart';

class ApiBase {
  static final _dio = Dio();

  static Future<Response> getRequest({
    required String path,
  }) async {
    var response = await _dio.get(
      path,
    );
    return response;
  }

  static Future<Response> postRequest({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    var response = await _dio.post(
      path,
      data: data,
    );

    return response;
  }
}

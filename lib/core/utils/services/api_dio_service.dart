import 'package:dio/dio.dart';

class ApiDioService {
  final Dio _dio;

  ApiDioService()
      : _dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
            sendTimeout: const Duration(seconds: 60),
            followRedirects: false,
            receiveDataWhenStatusError: true,
          ),
        );

  Future<Map<String, dynamic>> post(
      {required String endPoint,
      Map<String, dynamic>? body,
      String? token,
      String? contentType}) async {
    try {
      var response = await _dio.post(endPoint,
          queryParameters: body,
          options: Options(
              headers: {'Authorization': 'Bearer $token'},
              contentType: contentType));
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> get(
      {required String endPoint,
      Map<String, dynamic>? body,
      String? token,
      String? contentType}) async {
    try {
      var response = await _dio.get(endPoint,
          queryParameters: body,
          options: Options(
              headers: {'Authorization': 'Bearer $token'},
              contentType: contentType));
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint, required Map<String, dynamic> data}) async {
    try {
      var response = await _dio.put(endPoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    try {
      var response = await _dio.delete(endPoint);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(DioException error) {
    return error.message;
  }
}

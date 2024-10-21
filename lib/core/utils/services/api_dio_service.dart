import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiDioService {
  final Dio _dio;

  ApiDioService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: dotenv.env['BASE_URL']!,
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
            sendTimeout: const Duration(seconds: 60),
            followRedirects: false,
            receiveDataWhenStatusError: true,
          ),
        );

  Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? headers,
      required body,
      String? token,
      String? contentType}) async {
    try {
      var response = await _dio.post(endPoint,
          data: body,
          options: Options(
              headers: headers ?? {'Authorization': 'Bearer $token'},
              contentType: contentType));
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> get(
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

  Future<Response> put(
      {required String endPoint, required Map<String, dynamic> data}) async {
    try {
      var response = await _dio.put(endPoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> delete({required String endPoint}) async {
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

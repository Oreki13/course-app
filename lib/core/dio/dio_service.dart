import 'package:course_app/core/config/app_config.dart';
import 'package:course_app/core/dio/network_service.dart';
import 'package:course_app/core/exception/app_exception.dart';
import 'package:course_app/core/exception/dio_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class DioNetworkService extends NetworkService {
  final Dio dio;

  DioNetworkService(this.dio) {
    dio.options = dioBaseOptions;
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => AppConfig.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;
    return header;
  }

  @override
  Future<Either<AppException, dynamic>> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final res = await dio.post(endpoint, data: data);

      return right(res);
    } on DioException catch (e) {
      final (message, statusCode) = handleDioException(e);
      return left(
        AppException(
          message: message,
          statusCode: statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<AppException, dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final res = await dio.get(endpoint, queryParameters: queryParameters);
      return right(res);
    } on DioException catch (e) {
      final (message, statusCode) = handleDioException(e);
      return left(
        AppException(
          message: message,
          statusCode: statusCode,
        ),
      );
    }
  }
}

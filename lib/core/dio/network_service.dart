import 'package:course_app/core/exception/app_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}

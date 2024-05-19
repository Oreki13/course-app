import 'dart:io';

import 'package:dio/dio.dart';

(String message, int statusCode) handleDioException(DioException e) {
  int statusCode = 500;
  String message = "";
  switch (e.runtimeType) {
    case SocketException:
      e as SocketException;
      message = 'Unable to connect to the server.';
      statusCode = 0;
      break;

    case DioException:
      e;
      if (e.response?.data.runtimeType == String) {
        message = e.response?.data ?? "Internal Error occurred";
      } else {
        message = e.response?.data?['message'] ?? 'Internal Error occurred';
      }

      statusCode = 1;
      break;

    default:
      message = 'Unknown error occurred';
      statusCode = 2;
  }
  return (message, statusCode);
}

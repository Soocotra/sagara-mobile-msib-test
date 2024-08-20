import 'package:dio/dio.dart';

class AppError extends DioException {
  AppError(
      {required super.requestOptions,
      super.error,
      super.message,
      super.response,
      super.stackTrace,
      super.type});

}

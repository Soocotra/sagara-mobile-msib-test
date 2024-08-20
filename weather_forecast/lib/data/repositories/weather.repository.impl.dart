import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:weather_forecast/core/resource/data_resources.dart';

import '../../core/error/app_error.dart';
import '../../domain/repositories/weather.repository.dart';
import '../data_sources/weather_services.dart';
import '../models/param/get_weather.param.dart';
import '../models/weather.model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherServices _weatherService;

  WeatherRepositoryImpl(this._weatherService);

  @override
  Future<DataState<WeatherModel>> getWeather({GetWeatherParam? params}) async {
    try {
      final res = await _weatherService.getWeather(
          apiKey: dotenv.env["API_KEY"], lat: params?.lat, lon: params?.lon);
      if (res.response.statusCode == HttpStatus.ok) {
        return DataSuccess<WeatherModel>(res.data);
      } else {
        return DataFailed(AppError(
            error: res.response.statusMessage,
            response: res.response,
            type: DioExceptionType.badResponse,
            requestOptions: res.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(AppError(
          error: e.response?.statusMessage,
          response: e.response,
          message: e.error is SocketException
              ? "Check your internet connection"
              : e.message,
          type: DioExceptionType.badResponse,
          requestOptions: e.response != null
              ? e.response!.requestOptions
              : RequestOptions()));
    }
  }
}
